# Utilisation d'une image JRE légère pour l'exécution
FROM eclipse-temurin:17-jre-alpine

# Création d'un répertoire de travail
WORKDIR /app

# Copie du JAR (renommé par le pipeline)
COPY app.jar app.jar

# Commande d'exécution
ENTRYPOINT ["java", "-jar", "app.jar"]
