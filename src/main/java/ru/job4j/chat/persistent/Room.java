package ru.job4j.chat.persistent;

import ru.job4j.chat.model.Message;

import java.util.*;

public class Room {
    private final List<Message> messages = new ArrayList<>();

    private static final class Lazy {
        private static final Room INST = new Room();
    }

    public static Room instOf() {
        return Lazy.INST;
    }

    public void addMessage(Message message) {
        messages.add(message);
    }

    public List<Message> getMessages() {
        Comparator<Message> comparator = (o1, o2) -> o2.getCreated().compareTo(o1.getCreated());
        messages.sort(comparator);
        return messages;
    }
}
