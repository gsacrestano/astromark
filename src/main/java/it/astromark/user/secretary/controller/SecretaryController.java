package it.astromark.user.secretary.controller;

import io.swagger.v3.oas.annotations.Operation;
import it.astromark.user.commons.dto.SchoolUserDetailed;
import it.astromark.user.secretary.dto.SecretaryRequest;
import it.astromark.user.secretary.service.SecretaryService;
import jakarta.validation.constraints.NotNull;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/secretaries")
public class SecretaryController {

    private final SecretaryService secretaryService;

    public SecretaryController(SecretaryService secretaryService) {
        this.secretaryService = secretaryService;
    }

    @Operation(
            summary = "Create a secretary account",
            description = "Creates a new secretary account with the provided details."
    )
    @PostMapping
    public SchoolUserDetailed create(@RequestBody @NotNull SecretaryRequest secretaryRequest) {
        return secretaryService.create(secretaryRequest);
    }
}
