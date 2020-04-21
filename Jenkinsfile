pipeline {
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
                        def customImage = docker.build("my-image:${env.BUILD_ID}")
                        customImage.push()
                        customImage.push('latest')
                    }
                }
         }
         

}
}
