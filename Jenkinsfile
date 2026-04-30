pipeline {
    agent any
    
    tools {
        maven 'Maven3'
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
                sh "ls -la"
                sh "cd java-maven/maven && mvn clean test package"
            }
        }
    }
}
