pipeline {
    agent any
    stages {
        stage('terraform init and validate') {
            steps {
                echo "terraform init and validate"
            }
        }
        stage('terraform plan') {
            steps {
                echo "terraform plan"
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
                echo "terraform apply"
            }
        }
    }
}