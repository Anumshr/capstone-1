pipeline {
    environment {
    registry = "anumshr/bluedep"
    registryCredential = 'dockerhub'
      }
     agent any
     stages {
         stage('Build') {
             steps {
                 sh 'echo "Hello World"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
         stage('Lint HTML') 
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Create Docker image'){
                steps {
                    script {
                        customeImage = docker.build registry 
                    }
                }
         }
         stage('Push image to dockerhub'){
                steps {
                      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
                    sh '''
                        docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                        docker push anumshr/capstone
                    '''  
                }
                }
                }
}
}
