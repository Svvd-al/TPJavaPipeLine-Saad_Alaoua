pipeline {
    agent {
        docker {
            image 'my-maven-git:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    stages {

        stage('Checkout') {
            steps {
                deleteDir()
                sh 'git clone https://github.com/Svvd-al/TPJavaPipeLine-Saad_Alaoua'
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
