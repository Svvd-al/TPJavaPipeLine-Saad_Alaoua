pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    sh 'ls -la'
                    
                    def mavenDir = null
                    if (fileExists('java-maven/maven/pom.xml')) {
                        mavenDir = 'java-maven/maven'
                    } else if (fileExists('Maven/pom.xml')) {
                        mavenDir = 'Maven'
                    } else if (fileExists('mavenprog/pom.xml')) {
                        mavenDir = 'mavenprog'
                    } else if (fileExists('pom.xml')) {
                        mavenDir = '.'
                    } else {
                        error 'Impossible de trouver le fichier pom.xml'
                    }
                    
                    echo "Répertoire du projet Maven : ${mavenDir}"
                    
                    dir(mavenDir) {
                        sh 'mvn clean test package'
                        sh '''
                            JAR_FILE=$(find target -maxdepth 1 -name "*.jar" ! -name "*sources.jar" ! -name "*javadoc.jar" | head -n 1)
                            if [ -z "$JAR_FILE" ]; then
                                echo "Aucun fichier JAR trouvé"
                                exit 1
                            fi
                            echo "JAR trouvé: $JAR_FILE"
                            java -cp "$JAR_FILE" com.tp.pipeline.App 2>/dev/null || echo "Classe principale non trouvée, exécution ignorée"
                        '''
                    }
                }
            }
        }
    }
}
