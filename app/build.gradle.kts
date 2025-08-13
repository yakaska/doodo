import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id("convention-jvm-module")
    id("detekt-common-configuration")
    id("spotbugs-common-configuration")

    alias(libs.plugins.springframework.boot)
    alias(libs.plugins.kotlin.plugin.spring)
    jacoco
}

springBoot {
    mainClass.set("ru.yakaska.doodo.EntryPointKt")
}

jacoco {
    toolVersion = libs.versions.jacoco.get()
}

dependencies {
    implementation(platform(libs.spring.boot.bom))
    implementation(libs.spring.boot.starter.web)

    implementation(libs.kotlin.logging)
    implementation(libs.springboot.cache)

    testImplementation(libs.bundles.mockito)
    testImplementation(libs.bundles.junit5)
    testImplementation(libs.springframework.starter.test)
}

tasks {
    compileKotlin {
        compilerOptions.jvmTarget.set(JvmTarget.JVM_17)
    }

    clean {
        copySpec {
            delete("${project.projectDir}/logs")
            delete("${project.projectDir}/templates")
            delete("${layout.buildDirectory}")
        }
    }

    bootRun {
        systemProperty("spring.profiles.active", "STUB,stubMode")
    }

    jar {
        enabled = true
        archiveClassifier.set("")
    }

    bootJar {
        enabled = false
    }

    test {
        useJUnitPlatform()
        finalizedBy(jacocoTestReport)
    }

    jacocoTestReport {
        dependsOn(test)

        reports {
            xml.required.set(true)
            html.required.set(true)
            csv.required.set(true)
        }
    }

    check {
        dependsOn(jacocoTestReport)
    }
}
