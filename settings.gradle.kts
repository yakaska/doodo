dependencyResolutionManagement {
    @Suppress("UnstableApiUsage")
    repositories {
        mavenCentral()
        gradlePluginPortal()
    }
}

rootProject.name = "doodo"

include(":app")
include(":scheduler")
include(":email-sender")
