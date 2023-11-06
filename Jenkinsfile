pipeline {
    agent any
    
    stages {
        stage ("Clone Code"){
            steps {
                echo "Clone code from github repository"
                git url: "https://github.com/ShAhSyedG/todo-node-app.git", branch: "master"
            }
        }
        stage ("Build the image"){
            steps {
                echo "Build image from cloned code from github"
                sh "docker build . -t todo-node-app"
            }
        }
        stage ("Push image to Docker Hub"){
            steps {
                withCredentials ([usernamePassword(credentialsId:"dockerHub", passwordVariable:"dockerHubPass", usernameVariable:"dockerHubUser")]){
                sh "docker tag todo-node-app:latest ${env.dockerHubUser}/todo-node-app:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/todo-node-app:latest"
                }
            }
        }
        stage ("Run the container"){
            steps {
                echo "run the container"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
