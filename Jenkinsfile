pipeline {
    agent any

    environment {
        // GITHUB_CREDENTIALS = credentials('github-token')  
        // DOCKER_CREDENTIALS = credentials('docker-hub')    
        DOCKER_IMAGE = "gunjan068/java-hello-world:latest"  // Replace with your DockerHub username
    }

    stages {
        stage('Clone Repository') {
            steps {
               
                    // git credentialsId: 'github-token', url: 'https://github.com/gungun9950/java-hello-world.git', branch: 'main'
                    git branch: 'main', url: 'https://github.com/gungun9950/java-hello-world.git'
                }
            }
        

        stage('Create Dockerfile') {
            steps {
                script {
                    writeFile file: 'Dockerfile', text: """
                    FROM openjdk:17
                    WORKDIR /app
                    COPY . /app
                    EXPOSE 4000
                    RUN javac helloworld.java
                    CMD ["java", "helloworld"]
                    """
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        // stage('Login to Docker Hub') {
        //     steps {
        //         script {
        //             sh "echo \$DOCKER_CREDENTIALS_PSW | docker login -u \$DOCKER_CREDENTIALS_USR --password-stdin"
        //         }
        //     }
        // }

        stage('Push Docker Image') {
            steps {
                script {
                    // This step should not normally be used in your script. Consult the inline help for details.
                   withDockerRegistry(credentialsId: 'gunjan068') {
                      sh "docker push $DOCKER_IMAGE"
                }
            }
          }
        }
        stage('Run Container') {
            steps {
                script {
                    sh "docker run --name=java -d -p 4000:4000  $DOCKER_IMAGE"
                }
            }
        }
    }
}
    // post {
    //     success {
    //         echo "Pipeline execution successful! "
    //     }
    //     failure {
    //         echo "Pipeline failed! Check logs for errors. "
    //     }
    // }



