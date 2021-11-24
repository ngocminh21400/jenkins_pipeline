pipeline{
    agent {
        node{
            label 'centos-vm'
        }
    }
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
                    // sh 'docker tag angular-project mingming21400/angular-project'
                    // sh 'docker run -d -p 99:80 mingming21400/angular-project'
                    sh 'curl http://localhost:99'
                    echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                }
            }
        }
        stage('selenium test'){
            steps{
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                sh 'python3 test.py'
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}