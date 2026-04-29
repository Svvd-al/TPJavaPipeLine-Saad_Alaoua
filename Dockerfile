
FROM eclipse-temurin:17-jre-alpine

COPY mavenprog/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]