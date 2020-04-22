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
         
         
         stage ('Adding to Kubernetes Cluster'){
            steps{
                    withAWS(credentials: 'awscred', region: 'us-west-2'){
                        sh '''
                        aws eks --region us-west-2 update-kubeconfig --name nginxcluster
                        '''   
                }
                }
                }
       
}
}
