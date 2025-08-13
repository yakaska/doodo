import org.gradle.accessors.dm.LibrariesForLibs

plugins {
    id("io.gitlab.arturbosch.detekt")
}

detekt {
    toolVersion = "1.23.1"
    config.setFrom("${project.rootDir}/config/detekt/detekt-config.yml")
    parallel = true
    buildUponDefaultConfig = true
    allRules = false
}

val libs = the<LibrariesForLibs>()

dependencies {
    detektPlugins(libs.detekt.formatting)
}
