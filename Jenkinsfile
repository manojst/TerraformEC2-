pipeline{
    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    agent {label 'agent' }
    tools { terraform 'terraform' }
    stages{
        stage('checkout') {
            steps {
                 script{
                    dir("terraform")
                    {
                        git "https://gitlab.training.dagility.com/manojkumar_gnanasekaran/terraformec2.git"
                    }   
                }
            }
        }
        /*stage('Plan') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace new ${environment}'
                sh 'terraform workspace select ${environment}'
                sh 'terraform plan -input=false -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }*/
        stage('Deploy') {
            steps {
                script {
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }    
}
