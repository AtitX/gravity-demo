pipeline {
  agent {
    dockerfile {
      // label 'tele-buildbox:latest'
      // 'tele-buildbox:latest'
      additionalBuildArgs '--build-arg TELE_VERSION=7.0.5'
      args '-v /tmp:/tmp'
      args '-v /tmp/tele-cache:/mnt/tele-cache'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
      args '-v $(pwd):/mnt/app'
      args '-w /mnt/cluster'
      args '--net=host'
    }

  }
  stages {
    // stage('Test') {
    //   steps {
    //     sh 'git --version'
    //     sh 'curl --version'
    //   }
    // }

    stage('Checkout') {
      steps {
        //git credentialsId: '8140c26b-1d8d-40d0-bc2a-3f56672f8e57', url: 'https://github.com/PrashantBhatasana/terraform-jenkins-ec2'
        git url: 'https://github.com/gravitational/gravity.git'
      }
    }

    stage('Build') {
      // agent {
      //   docker {
      //     image 'tele-buildbox:latest'
      //     args '-v /tmp/tele-cache:/mnt/tele-cache'
      //     args '-v /var/run/docker.sock:/var/run/docker.sock'
      //     args '-v $(pwd):/mnt/app'
      //     args '-w /mnt/cluster'
      //     args '--net=host'
      //     reuseNode true
      //   }
      // }
      steps {
        script {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '	12969df0-2291-4a1a-82f4-a1e6fb970a61', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            // bash -c "tele --state-dir=/mnt/tele-cache build -o cluster.tar overlays/onprem/vpc-grvty.taskworld.com"
            // sh 'tele --state-dir=/mnt/tele-cache build -o wordpress.tar examples/wordpress/resources/app.yaml'
            sh 'tele build -o wordpress.tar examples/wordpress/resources/app.yaml'
          }
          sh 'tele version'

        }

      }



    }

    stage('Test') {
      steps {
        // sh './gradlew check'
        sh 'git --version'
      }
    }


  }

  // post {
  //   always {
  //     archiveArtifacts artifacts: 'build/libs/**/*.jar', fingerprint: true
  //     junit 'build/reports/**/*.xml'
  //   }
  // }

}
