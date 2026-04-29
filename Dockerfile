# Utilisation d'une image Java légère
FROM openjdk:17-jdk-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier JAR (préparé par Jenkins) dans l'image
COPY app.jar app.jar

# Exposer le port de l'application
EXPOSE 8080

# Commande de démarrage
ENTRYPOINT ["java", "-jar", "app.jar"]
