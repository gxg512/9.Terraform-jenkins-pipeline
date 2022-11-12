pipeline {
    agent any
    stages {
        stage('terraform init and validate') {
            steps {
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
