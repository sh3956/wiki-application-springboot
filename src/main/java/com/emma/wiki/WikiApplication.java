package com.emma.wiki;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@ComponentScan("com.emma")
@SpringBootApplication
public class WikiApplication {
    private static final Logger LOG = LoggerFactory.getLogger(WikiApplication.class);
    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(WikiApplication.class);
        Environment env = app.run(args).getEnvironment();
        LOG.info("Started");
        LOG.info("Address: \thttp://127.0.0.1:8890");
    }


}
