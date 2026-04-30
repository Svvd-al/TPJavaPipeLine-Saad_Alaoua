pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                git url: 'https://github.com/simoks/java-maven.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh '''
                    cd java-maven/maven
                    chmod +x mvnw
                    ./mvnw clean test package
                    java -jar target/maven-0.0.1-SNAPSHOT.jar
                '''
            }
        }
    }
}
