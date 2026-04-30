FROM maven:3.9.6-eclipse-temurin-17

# Installer git (souvent absent de l'image Maven de base)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Optionnel : Définir des variables d'environnement
ENV MAVEN_OPTS="-Dmaven.repo.local=/root/.m2"
