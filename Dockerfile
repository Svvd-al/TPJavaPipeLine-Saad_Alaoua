# Utilisation d'une image Java légère
FROM eclipse-temurin:17-jre-alpine

# Dossier de travail dans le conteneur
WORKDIR /app

# On copie le fichier app.jar (créé par l'étape 'cp' du Jenkinsfile)
COPY app.jar app.jar

# Lancement de l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
