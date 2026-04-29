pipeline {
    agent any

    tools {
        maven 'Maven3' // نفس الاسم لي حطيتي في Jenkins Tools
    }

    stages {

        stage('Checkout') {
            steps {
                deleteDir()
                git 'https://github.com/simoks/java-maven.git'
            }
        }

        stage('Build') {
            steps {
                dir('java-maven/maven') {
                    sh 'mvn clean test package'
                }
            }
        }

        stage('Run') {
            steps {
                dir('java-maven/maven') {
                    sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar'
                }
            }
        }
    }
}
