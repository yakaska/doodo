plugins {
    alias(libs.plugins.kotlin.plugin.spring) apply false
    alias(libs.plugins.springframework.boot) apply false
}

allprojects {
    group = "ru.yakaska"
    version = "0.0.1-SNAPSHOT"
}