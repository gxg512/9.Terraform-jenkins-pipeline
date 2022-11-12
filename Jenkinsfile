pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    =  "us-east-1"
    }
    stages {
        stage('terraform init and validate') {
            steps {
                sh 'echo ${AWS_ACCESS_KEY_ID}'
                sh 'terraform init && terraform fmt && terraform validate'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Choice') {
            steps {
            script {
                    env.workspace = input message: 'User input required', ok: 'Apply!',
                            parameters: [choice(name: 'Deploy the code?', choices: 'QA\nDEV')]
                }
            }  }
        stage('terraform apply') {
            steps {
               sh 'terraform workspace new QA && terraform workspace select QA && terraform apply'
            }
        }
    }
}
