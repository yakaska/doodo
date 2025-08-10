plugins {
    kotlin("jvm")
    kotlin("kapt")
}

kotlin {
    jvmToolchain(17)
}

kapt {
    keepJavacAnnotationProcessors = true
}