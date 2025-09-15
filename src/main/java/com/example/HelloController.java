package com.example;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/hello")
public class HelloController {
    
    @PostMapping
    public Map<String,Object> sayHello(HelloModel helloModel) {
        return Map.of("message", "Hello, %s!".formatted(helloModel.name()));
    }
    
}
