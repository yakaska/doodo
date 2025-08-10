package ru.yakaska.doodo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class EntryPoint

fun main(args: Array<String>) {
    runApplication<EntryPoint>(*args)
}
