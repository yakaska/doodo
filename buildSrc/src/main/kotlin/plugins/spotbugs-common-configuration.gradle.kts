import com.github.spotbugs.snom.Effort
import org.gradle.accessors.dm.LibrariesForLibs

val libs = the<LibrariesForLibs>()

plugins {
    id("com.github.spotbugs")
}

spotbugs {
    effort.set(Effort.MAX)
    excludeFilter.set(file("${rootDir}/config/spotbugs/excludeFilters.xml"))
    ignoreFailures.set(false)
}

dependencies {
    spotbugsPlugins(libs.bundles.spotbugs)
}
