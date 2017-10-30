# Spring 5, Embedded Tomcat 8, and Gradle: a Quick Tutorial

This repository accompanies the [Spring 5, Embedded Tomcat 8, and Gradle: a Quick Tutorial](https://auth0.com/blog/spring-5-embedded-tomcat-8-gradle-tutorial)
article on Auth0's blog. Head there to learn how to embed Tomcat 8 on a Spring 5 project managed by Gradle.

## Useful Commands


```bash
# create uber jar
./gradlew clean shadowJar

# run uber jar
java -jar build/libs/embedded-spring-5-1.0-SNAPSHOT-all.jar
```
