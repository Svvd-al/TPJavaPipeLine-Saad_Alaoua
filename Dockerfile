# Dockerfile simple après compilation locale
FROM eclipse-temurin:17-jre

# Copier le JAR déjà compilé
COPY mavenprog/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
