pipeline{
    agent any
    parameters{
        choice (name: 'env', choices:['qa','dev', 'prod'],description: 'choose environment')
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
                sh "terraform plan -var-file=env-${env}/${env}.tfvars -out=dev.tfplan"
            }
        }
        stage('terraform action'){
            steps{
                sh "terraform apply -input=false dev.tfplan"
            }
        }
    }
}