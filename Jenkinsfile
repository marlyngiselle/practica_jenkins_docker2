pipeline {
   agent any

   stages {

       stage('codigo') {
           steps{
               git 'https://github.com/marlyngiselle/practica_jenkins_docker2.git'
           }
       }

       stage('build') {
           steps {
                sh 'docker stop luna'
                sh 'docker rm luna'
                sh 'docker build -t mgiselle/${JOB_NAME}:v${BUILD_NUMBER} .'
           }
       }

       stage('test') {
           steps {
               echo "Ingresa a la pagina http://laluna"
           }
       }

       stage('release') {
           steps {
                sh 'docker tag mgiselle/${JOB_NAME}:v${BUILD_NUMBER} mgiselle/${JOB_NAME}:latest'
                sh 'docker login -u="mgiselle" -p="Tasia.2411"'
                sh 'docker push mgiselle/${JOB_NAME}:v${BUILD_NUMBER}'
                sh 'docker push mgiselle/${JOB_NAME}:latest'
                sh 'docker rmi mgiselle/${JOB_NAME}:v${BUILD_NUMBER}'
                sh 'docker rmi mgiselle/${JOB_NAME}:latest'
           }
       }

       stage('deploy') {
           steps {
                sh 'docker run -d -p 80:80 --name luna mgiselle/${JOB_NAME}:latest'
           }
       }

   }
   

}