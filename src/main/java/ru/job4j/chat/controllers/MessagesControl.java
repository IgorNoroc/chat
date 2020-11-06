package ru.job4j.chat.controllers;

import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ru.job4j.chat.model.Message;
import ru.job4j.chat.model.Person;
import ru.job4j.chat.model.Role;
import ru.job4j.chat.persistent.Room;

import java.util.Date;

@Controller
public class MessagesControl {
    @GetMapping("/allMessages")
    public @ResponseBody
    String getMessages() {
        return new Gson().toJson(
                Room.instOf().getMessages());
    }

    @PostMapping("/addMessage")
    public String addMessage(@RequestParam("message") String mess,
                             @RequestParam("created") Date created,
                             @RequestParam("personName") String personName,
                             @RequestParam("role") String role) {
        Room.instOf().addMessage(
                new Message(
                        mess,
                        created,
                        new Person(
                                personName, new Role(role)
                )));
        return "room";
    }
}
