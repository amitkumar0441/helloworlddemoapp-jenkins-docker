pipeline {
    agent any 
    stages {
        stage('stage 01- clone the code') {
            steps {
                git branch: 'main', url: 'https://github.com/amitkumar0441/helloworlddemoapp-jenkins-docker.git'
            }
        }
        stage('stage 02- build the image') {
            steps {
                sh '''docker build -t amitkumar0441/docker-helloworld:${BUILD_NUMBER} .'''
            }
        }
        stage('stage 03- push image to dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"
                        docker push amitkumar0441/docker-helloworld:${BUILD_NUMBER}
                        docker logout
                    '''
                }
            }
        }
        stage('stage 04- stopped and removed old container and run the container of new version') {
            steps {
                sh '''
                # Stop and remove the old container (if it exists)
                docker stop helloworldcontainer || true
                docker rm helloworldcontainer || true
                # run the new container
                docker run -d --name helloworldcontainer -p 8060:8080 amitkumar0441/docker-helloworld:${BUILD_NUMBER}'''
            }
        }
    }
}


