pipeline{
    agent {label 'workstation'}
    parameters{
        choice (name: 'ENVI', choices:['dev', 'prod'],description: 'choose environment')
        choice (name: 'ACTION', choices:['apply','destroy'],description: 'choose action')
    }
    options{
        ansiColor('xterm')
    }
    stages {
        stage('terraform init'){
            steps{
                sh "terrafile -f ./env-${ENVI}/Terrafile"
                sh "terraform init -backend-config=env-${ENVI}/${ENVI}-backend.tfvars"
            }
        }
        stage('terraform plan'){
            steps{
                sh "rm ${ENVI}.tfplan || true"
                sh "terraform plan -var-file=env-${ENVI}/${ENVI}.tfvars"
            }
        }
        stage('terraform action'){
            steps{
                sh "terraform ${ACTION}"
            }
        }
    }
}