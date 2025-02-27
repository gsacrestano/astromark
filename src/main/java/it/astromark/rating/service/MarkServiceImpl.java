package it.astromark.rating.service;


import it.astromark.authentication.service.AuthenticationService;
import it.astromark.classmanagement.didactic.repository.TeachingRepository;
import it.astromark.classmanagement.repository.SchoolClassRepository;
import it.astromark.commons.exception.GlobalExceptionHandler;
import it.astromark.rating.dto.*;
import it.astromark.rating.mapper.MarkMapper;
import it.astromark.rating.model.Mark;
import it.astromark.rating.repository.MarkRepository;
import it.astromark.rating.repository.SemesterReportRepository;
import it.astromark.user.commons.service.SchoolUserService;
import it.astromark.user.student.entity.Student;
import it.astromark.user.student.repository.StudentRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.function.Supplier;

@Service
@Slf4j
public class MarkServiceImpl implements MarkService {

    private final MarkRepository markRepository;
    private final MarkMapper markMapper;
    private final SchoolUserService schoolUserService;
    private final SemesterReportRepository semesterReportRepository;
    private final AuthenticationService authenticationService;
    private final TeachingRepository teachingRepository;
    private final StudentRepository studentRepository;
    private final SchoolClassRepository schoolClassRepository;

    @Autowired
    public MarkServiceImpl(MarkRepository markRepository, MarkMapper markMapper, SchoolUserService schoolUserService, SemesterReportRepository semesterReportRepository, AuthenticationService authenticationService, TeachingRepository teachingRepository, StudentRepository studentRepository, SchoolClassRepository schoolClassRepository) {
        this.markRepository = markRepository;
        this.markMapper = markMapper;
        this.schoolUserService = schoolUserService;
        this.semesterReportRepository = semesterReportRepository;
        this.authenticationService = authenticationService;
        this.teachingRepository = teachingRepository;
        this.studentRepository = studentRepository;
        this.schoolClassRepository = schoolClassRepository;
    }


    @Override
    @PreAuthorize("hasRole('STUDENT') || hasRole('PARENT')")
    public List<MarkResponse> getMarkByYear(@NotNull UUID studentId, @PastOrPresent Year year) {
        if (!schoolUserService.isLoggedUserParent(studentId) || !schoolUserService.isLoggedStudent(studentId)) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }
        return markMapper.toMarkResponseList(markRepository.findMarkByStudentIdAndDateBetween(studentId, LocalDate.of(year.getValue(), Month.SEPTEMBER, 1),
                LocalDate.of(year.getValue() + 1, Month.AUGUST, 31)));
    }

    @Override
    @PreAuthorize("hasRole('STUDENT') || hasRole('PARENT')")
    public Double getAverage(@NotNull UUID studentId, @PastOrPresent Year year) {
        return Math.round(getMarkByYear(studentId, year).stream()
                .mapToDouble(MarkResponse::mark)
                .average()
                .orElse(0.0) * 100) / 100.0;
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('STUDENT') || hasRole('PARENT') || hasRole('TEACHER')")
    public SemesterReportResponse getReport(@NotNull UUID studentId, @PositiveOrZero Short year, @NotNull Boolean semester) {
        Supplier<AccessDeniedException> accessDeniedException = () -> new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);

        if (!schoolUserService.isLoggedUserParent(studentId)) {
            throw accessDeniedException.get();
        } else if (!schoolUserService.isLoggedStudent(studentId)) {
            throw accessDeniedException.get();
        } else if (!schoolUserService.isLoggedTeacherStudent(studentId)) {
            throw accessDeniedException.get();
        }

        var report = semesterReportRepository.findByStudent_IdAndFirstSemesterAndYear(studentId, semester, year);
        if (report.isEmpty()) {
            return null;
        } else if (!report.getFirst().getPublicField() && authenticationService.isStudent()) {
            throw accessDeniedException.get();
        }


        return markMapper.toSemesterReportResponse(report.getFirst());

    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('PARENT')")
    public SemesterReportResponse viewReport(@NotNull Integer reportId) {
        var report = semesterReportRepository.findById(reportId).orElseThrow();

        if (!schoolUserService.isLoggedUserParent(report.getStudent().getId())) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }

        report.setViewed(true);
        semesterReportRepository.save(report);

        return markMapper.toSemesterReportResponse(report);
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('TEACHER')")
    public List<RatingsResponse> getRatings(@NotNull Integer classId, @NotEmpty String teaching, @NotNull LocalDate date) {
        if (!schoolUserService.isLoggedTeacherClass(classId) ||
                teachingRepository.findByTeacher(authenticationService.getTeacher().orElseThrow())
                        .stream()
                        .noneMatch(t -> t.getSubjectTitle()
                                .getTitle()
                                .equals(teaching))
                || date.isAfter(LocalDate.now())) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }

        var marks = markMapper.toRatingsResponseList(markRepository.findAllMarksBySchoolClassAndDateAndTeaching_SubjectTitle_Title(classId, date, teaching), teaching);

        for (Student student : schoolClassRepository.findById(classId).orElseThrow().getStudents()) {
            if (marks.stream().noneMatch(m -> m.studentId().equals(student.getId()))) {
                marks.add(new RatingsResponse(null, student.getId(), student.getName(), student.getSurname(), teaching, null, null, "", null));
            }
        }

        return marks;
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('TEACHER')")
    public List<RatingsResponse> getEveryRatings(@NotNull Integer classId, @NotEmpty String teaching) {
        if (!schoolUserService.isLoggedTeacherClass(classId) ||
                teachingRepository.findByTeacher(authenticationService.getTeacher().orElseThrow())
                        .stream()
                        .noneMatch(t -> t.getSubjectTitle()
                                .getTitle()
                                .equals(teaching))) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }

        var year = schoolClassRepository.findById(classId).orElseThrow().getYear();
        var marks = markRepository.findAllMarksBySchoolClassAndDateRangeAndTeaching_SubjectTitle_Title(classId,
                LocalDate.of(year, Month.SEPTEMBER, 1),
                LocalDate.of(year + 1, Month.AUGUST, 31),
                teaching);

        marks.sort(Comparator.comparing((Mark m) -> m.getStudent().getSurname()).thenComparing(Mark::getDate));
        var ratings = markMapper.toRatingsResponseList(marks, teaching);

        for (Student student : schoolClassRepository.findById(classId).orElseThrow().getStudents()) {
            if (ratings.stream().noneMatch(m -> m.studentId().equals(student.getId()))) {
                ratings.add(new RatingsResponse(null, student.getId(), student.getName(), student.getSurname(), teaching, null, null, "", null));
            }
        }

        return ratings;
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('TEACHER')")
    public MarkResponse create(@NotNull MarkRequest mark) {
        if (!mark.date().isBefore(LocalDate.now().plusDays(1))) {
            throw new IllegalArgumentException("Date must be in the past");
        }
        if (mark.mark() < 0 || mark.mark() > 10) {
            throw new IllegalArgumentException("Mark must be between 0 and 10");
        }
        if (mark.type() == null) {
            throw new IllegalArgumentException("Mark type must be specified");
        }
        var teacher = authenticationService.getTeacher().orElseThrow();
        var teaching = teachingRepository.findById(mark.teachingId()).orElseThrow();
        if (!teaching.getTeacher().equals(teacher)) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }
        if (!schoolUserService.isLoggedTeacherStudent(mark.studentId())) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }

        return markMapper.toMarkResponse(markRepository.save(Mark.builder()
                .mark(mark.mark())
                .date(mark.date())
                .student(studentRepository.findById(mark.studentId()).orElseThrow())
                .teaching(teaching)
                .type(mark.type())
                .description(mark.description())
                .build()));
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('TEACHER')")
    public MarkResponse update(@NotNull MarkUpdateRequest mark, @NotNull UUID studentId) {
        if (mark.mark() < 0 || mark.mark() > 10) {
            throw new IllegalArgumentException("Mark must be between 0 and 10");
        }
        if (!schoolUserService.isLoggedTeacherStudent(studentId)) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }
        var markEntity = markRepository.findById(mark.id()).orElseThrow();
        var teacher = authenticationService.getTeacher().orElseThrow();
        if (!markEntity.getTeaching().getTeacher().equals(teacher)) {
            throw new AccessDeniedException(GlobalExceptionHandler.AUTHORIZATION_DENIED);
        }

        markEntity.setMark(mark.mark());
        markEntity.setDescription(mark.description());
        markEntity.setType(mark.type());

        return markMapper.toMarkResponse(markRepository.save(markEntity));
    }

    @Override
    @Transactional
    @PreAuthorize("hasRole('TEACHER')")
    public boolean delete(@NotNull Integer id) {
        var mark = markRepository.findById(id).orElseThrow();
        var teacher = authenticationService.getTeacher().orElseThrow();
        if (!mark.getTeaching().getTeacher().equals(teacher)) {
            return false;
        }

        markRepository.delete(mark);
        return true;
    }

}
