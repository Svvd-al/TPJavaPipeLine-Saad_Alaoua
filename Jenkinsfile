pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                sh "git clone https://github.com/simoks/java-maven.git"
            }
        }
        stage('Build') {
            steps {
                script {
                    dir('java-maven/maven') {
                        sh 'mvn clean test package'
                        sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar'
                    }
                }
            }
        }
    }
}
