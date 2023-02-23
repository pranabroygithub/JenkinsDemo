pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pranabroygithub/JenkinsDemo.git']])
            }
        }
        
        stage('code analysis'){
            environment {
                scannerHome = tool 'sonar1'
            }
            steps{
                
                withSonarQubeEnv('sonar1') {
                echo "$ScannerHome"
                 sh "${scannerHome}/bin/sonar-scanner"
                }
                
            }
        }

        stage('Docker build'){
            steps{
                script{
                    docker.build registry
                }
            }
        }

        stage('Docker push'){
            steps{
              sh "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/x9w0j1w9"
              sh "docker push public.ecr.aws/x9w0j1w9/pranab-docker-images:latest"
            }
        }
        
        stage('deploy container in eks'){
            steps{
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8-kubeconfig', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    sh "kubectl apply -f my-app-deply.yml"
                }
            }
        }
        
    }
}
