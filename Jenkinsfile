pipeline{
    agent any
    parameters{
        choice (name: 'env', choices:['qa','dev', 'prod'],description: 'choose environment')
    }
    options{
        ansiColor('xterm')
    }
    stages {
        stage('terraform init'){
            steps{
                sh "terrafile -f env-dev/Terrafile"
                sh "terraform init -backend-config=env-dev/dev-backend.tfvars"
            }
        }
        stage('terraform plan'){
            steps{
                sh "rm dev.tfplan"
                sh "terraform plan -var-file=env-dev/dev.tfvars -out=dev.tfplan"
            }
        }
        stage('terraform action'){
            steps{
                sh "terraform apply -input=false dev.tfplan"
            }
        }
    }
}