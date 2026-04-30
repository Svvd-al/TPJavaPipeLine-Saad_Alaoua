pipeline {
    agent any
    
    tools {
        maven 'maven3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                sh "git clone https://github.com/simoks/java-maven.git"
            }
        }
        stage('Build') {
            steps {
                sh '''
                    cd java-maven/maven
                    mvn clean test package
                '''
            }
        }
    }
}
