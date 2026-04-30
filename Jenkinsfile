pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                git url: 'https://github.com/simoks/java-maven.git', branch: 'main'
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
