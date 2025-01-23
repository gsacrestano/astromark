package it.astromark.communication.controller;

import it.astromark.communication.dto.CommunicationResponse;
import it.astromark.communication.service.CommunicationService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/schoolClasses")
public class CommunicationController {

    private final CommunicationService communicationService;

    public CommunicationController(CommunicationService communicationService) {
        this.communicationService = communicationService;
    }

    @GetMapping("/{schoolClassId}/communications")
    public List<CommunicationResponse> getCommunicationBySchoolClassId(@PathVariable Integer schoolClassId) {
        return communicationService.getCommunicationBySchoolClassId(schoolClassId);
    }

}
