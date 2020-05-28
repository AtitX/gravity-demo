pipeline {
    agent { dockerfile { additionalBuildArgs '--build-arg TELE_VERSION=7.0.5' } }
    stages {
        stage('Test') {
            steps {
                sh 'git --version'
                sh 'curl --version'
            }
        }
    }
}
