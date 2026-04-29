pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                deleteDir()
                sh 'git clone https://github.com/simoks/java-maven.git'
            }
        }

        stage('Build') {
            steps {
                dir('java-maven/maven') {
                    sh 'mvn clean test package'
                    sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar'
                }
            }
        }
    }
}
