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
        
    }
}
