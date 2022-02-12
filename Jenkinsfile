pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh('mkdir photos && cp /opt/photos/* ./photos/*')
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