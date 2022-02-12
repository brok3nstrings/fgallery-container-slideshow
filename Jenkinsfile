pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh('cp /opt/photos/* ./photos/')
                sh('docker build . -t fgallery-slideshow:latest')
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}