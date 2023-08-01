pipeline {
    agent any
    
    stages{
        
        stage("Code Clone"){
            steps{
                echo "Cloning code from Github."
                git url: "https://github.com/NIS9860/django-notes-app.git", branch:"main"
            }
        }
        
        stage("Code Build"){
            steps{
                echo "Building the code using docker."
                sh "docker build -t web-notes-app ."
            }
        }
        
        stage("Code Push"){
            steps{
                echo "Pushing image to Dockerhub."
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerPass",usernameVariable:"dockerUser")]){
                sh "docker tag web-notes-app ${env.dockerUser}/web-notes-app:latest"
                sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                sh "docker push ${env.dockerUser}/web-notes-app:latest"
                }

            }
        }
        
        stage("Deploying Comtainer"){
            steps{
                echo "Deploying the condainer with docker-compose"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
