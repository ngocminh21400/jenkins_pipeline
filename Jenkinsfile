pipeline{
    agent { label 'centos-vm' }
    stages{
        stage('Update git'){
            steps{
                git 'https://github.com/ngocminh21400/jenkins_pipeline.git'
                echo 'Clone Done..'
            }
        }

        stage('Docker build'){
            steps{
                echo 'Building..'

                withDockerRegistry(credentialsId: 'docker-id') {
                    sh 'docker build -t angular-project .'
                    sh 'docker tag angular-project mingming21400/angular-project'
                    sh 'docker run -d -p 80:80 mingming21400/angular-project'
                    sh 'curl http://localhost'
                }
            }
        }
        stage('selenium test'){
            steps{
                sh 'python3 test.py'
            }
        }
    }
    post {
        always {
            echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        }
    }
}