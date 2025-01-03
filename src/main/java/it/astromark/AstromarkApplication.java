package it.astromark;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;

@SpringBootApplication(exclude = UserDetailsServiceAutoConfiguration.class)
public class AstromarkApplication {

    public static void main(String[] args) {
        SpringApplication.run(AstromarkApplication.class, args);
    }

}
