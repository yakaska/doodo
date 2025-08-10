package ru.yakaska.doodo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {

    @GetMapping("/hello")
    fun hello(): String {
        val string = "Hello World!"
        return string
    }
}
