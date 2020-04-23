pipeline {
    environment {
    registry = "anumshr/capstone"
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
         stage("install kubectl"){
            withAWS(credentials: 'awscred', region: 'us-west-2'){
                sh '''
                    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
                    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

                '''
            }
         }
         stage('Adding to Kubernetes Cluster'){
            steps{
                    withAWS(credentials: 'awscred', region: 'us-west-2'){
                    sh '''
                        aws eks --region us-west-2 update-kubeconfig --name nginxcluster
                     '''      
                }
                }
                }
        stage('running replication controller pods -blue '){
            steps{
                withAWS(credentials: 'awscred', region: 'us-west-2'){
               sh '''
                    kubectl apply -f ./blue-controller.json
                    '''
               } 
            }
        }
        stage('running replication controller pods -green '){
            steps{
                withAWS(credentials: 'awscred', region: 'us-west-2'){
               sh '''
                    kubectl apply -f ./green-controller.json
                    '''
               } 
            }
        }

         stage('Create Service'){
            steps{
               withAWS(credentials: 'awscred', region: 'us-west-2'){
               sh '''
                    kubectl apply -f ./blue-greenloadbalancerservice.json
                    '''
               } 
            }
        }
         
}
}
