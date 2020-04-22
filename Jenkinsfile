pipeline {
    environment {
    registry = "anumshr/greendep"
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
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Create Docker image'){
                steps {
                    script {
                        customeImage = docker.build registry + ":$BUILD_NUMBER"  
                    }
                }
         }
         stage('Push image to dockerhub'){
                steps {
                        script {
                                docker.withRegistry( 'http://hub.docker.com', registryCredential) { 
                                        /* Push the container to the custom Registry */
                                        customImage.push()
                        }
                }
         }
         }

}
}
