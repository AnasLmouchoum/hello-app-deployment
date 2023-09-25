package com.example.helloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping("/hello")
    public String sendGreetings() {
        return "Hello, World! This is My first deployment Using Docker, K8s & Jenkins";
    }


    @GetMapping("/bye")
    public String goodBye() {
        return "Bye! Disconnecting from this App";
    }

}
