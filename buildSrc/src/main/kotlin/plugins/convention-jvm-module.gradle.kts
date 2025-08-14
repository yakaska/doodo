plugins {
    kotlin("jvm")
    kotlin("kapt")
}

kotlin {
    jvmToolchain(21)
}

kapt {
    keepJavacAnnotationProcessors = true
}
