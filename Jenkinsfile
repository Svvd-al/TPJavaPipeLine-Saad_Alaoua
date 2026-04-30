pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                sh "https://github.com/Svvd-al/TPJavaPipeLine-Saad_Alaoua"
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
