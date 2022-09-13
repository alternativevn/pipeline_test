pipeline{
    agent any 
    environment {
        DOCKER_IMAGE="lamnv15/pipeline_test"
        DOCKER_TAG="1.6"
    }
    stages{
        stage("Build"){ 
            steps{
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} -f Dockerfile ."

                withCredentials([usernamePassword(credentialsId: 'dockerRegis', 
                                                  usernameVariable: 'DOCKER_USER' , 
                                                  passwordVariable: 'DOCKER_PASS')]) 
                {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
        stage("Deploy"){
            options {
                timeout(time: 10, unit: 'MINUTES')
            }
            steps {
                ansiblePlaybook(
                    credentialsId: 'global',
                    disableHostKeyChecking: true,
                    installation : "Ansible",
                    playbook: 'playbook.yml',
                    inventory: 'hosts',
                    become: 'yes',
                )
            }
        }
    }
}
