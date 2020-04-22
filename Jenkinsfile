pipeline {
    environment {
    registry = "anumshr/bluedep"
    registryCredential = 'dockerhub'
      }
     agent any
     stages {
         stage('Blue container deployed'){
            steps {
               withAWS(credentials: 'awscred', region: 'us-west-2'){
               sh '''
                    kubectl apply -f ./blue-controller.json
                    '''
               } 
            }
        }
}
}
