import org.gradle.api.tasks.Delete

plugins {
    id("com.android.application") version "7.0.4" apply false
    id("org.jetbrains.kotlin.android") version "1.5.31" apply false
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}