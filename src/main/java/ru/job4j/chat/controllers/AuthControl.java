package ru.job4j.chat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.job4j.chat.model.Person;
import ru.job4j.chat.model.Role;

import javax.servlet.http.HttpSession;

@Controller
public class AuthControl {
    @PostMapping("/auth")
    public String auth(@ModelAttribute Person person, HttpSession session) {
        person.setRole(new Role("user"));
        session.setAttribute("user", person);
        return "room";
    }
}
