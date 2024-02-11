pipeline{
    agent any
    parameters{
        choice (name: 'ENVI', choices:['qa','dev', 'prod'],description: 'choose environment')
        choice (name: 'Action', choices:['apply'. 'destroy'], description: 'choose action')
    }
    options{
        ansiColor('xterm')
    }
    stages {
        stage('terraform init'){
            steps{
                sh "terrafile -f env-${ENVI}/Terrafile"
                sh "terraform init -backend-config=env-${ENVI}/${ENVI}-backend.tfvars"
            }
        }
        stage('terraform plan'){
            steps{
                sh "rm ${ENVI}.tfplan"
                sh "terraform plan -var-file=env-${ENVI}/${ENVI}.tfvars -out=${ENVI}.tfplan"
            }
        }
        stage('terraform action'){
            steps{
                sh "terraform ${Action} -input=false ${ENVI}.tfplan"
            }
        }
    }
}