package ru.job4j.chat.model;

import java.util.Date;

public class Message {
    private String message;
    private Date created;
    private Person person;

    public Message(String message, Date created, Person person) {
        this.message = message;
        this.created = created;
        this.person = person;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}
