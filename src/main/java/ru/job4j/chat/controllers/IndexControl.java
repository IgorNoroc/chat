package ru.job4j.chat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexControl {
    @GetMapping({"/", "/index"})
    public String index() {
        return "index";
    }
}
