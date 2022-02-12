pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh('ls -lah')
                echo 'Building..'
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