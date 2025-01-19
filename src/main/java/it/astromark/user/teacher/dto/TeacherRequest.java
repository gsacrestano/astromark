package it.astromark.user.teacher.dto;

import jakarta.validation.constraints.*;

import java.time.LocalDate;

public record TeacherRequest(@Size(max = 256) @Email String email,
                             @Size(max = 64) @NotEmpty String name,
                             @Size(max = 64) @NotEmpty String surname,
                             String taxId, @Past LocalDate birthDate,
                             @NotNull Boolean male,
                             @Size(min = 5) @Pattern(regexp = "^[a-zA-Z0-9\\s.]+$")
                             String residentialAddress) {
}
