pipeline {
  agent any 
  tools{
    nodejs "node"
  }     
  stages{
      
       stage('Clone') {
          
    // Clones the repository from the current branch name
    
    steps{
   
        echo 'Make the output directory'
    sh 'mkdir -p build'
    
   
    dir('build') {
        git branch: 'main', url: 'https://github.com/SoulaimakH/astronot-angular.git'
    }  
     }
     
  } 
  
    stage('install node modules'){
     steps{
          dir('build') {
              
            sh "npm install"
              
    }  
       
     }
        
    }
     
  
          
        stage('build'){
         steps{
              dir('build') {
                   
           sh "npm run ng build --prod"}
              
         } 
        }
        
        stage('Pull Latest Code') {
    steps {
          dir('build') {
                   
             sh 'git pull origin main' // Assuming 'main' is your target branch
              
          }
              
         } 
         
       
    
    }

        
        stage('Test'){
             steps{
            sh "echo 'test'"}
        }
        
         stage('build docker file'){
         steps{
             
                   dir('build') {

           sh "docker compose build"
           sh "docker compose up -d"
                       
                   }
              
         } 
        }
        
    
 
 
  stage('Push to DockerHub') {
            steps {
                dir('build') {
                    //sh "docker tag build-astronot fatmal/getting-started"
                    //sh "docker push fatmal/getting-started"
                    sh "docker login -u fatmal -p 'dckr_pat_8vM_F2qqZk_PUK-nauBIaXxJ1V8'"
                    sh "docker tag build-astronot fatmal/jenkinstest:latest"
                    sh "docker push fatmal/jenkinstest:latest"
                    }
                }
            }
        
  }
}
