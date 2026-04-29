FROM openjdk:17-jdk-slim
# On utilise app.jar qu'on a copié à l'étape précédente
COPY app.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
