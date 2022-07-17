node {
    def aws_region = "us-east-1"
    def aws_account = "515321278346"
    def docker_repository = "${aws_account}.dkr.ecr.${aws_region}.amazonaws.com"
    def fruit = "candie"
    def namespace = "candie"

  stage('Preparation') { // for display purposes
      cleanWs()
      checkout scm
      echo "Building ${env.JOB_NAME}..."
      echo "Buileding parameters:"
      echo "  build = ${env.build}"
      echo "  deploy = ${env.deploy}"
  }

  stage('Build') { // Build docker artefact
    if(env.build == "true") {
      sh """
          aws ecr get-login-password --region $aws_region |\
            docker login --username AWS --password-stdin ${aws_account}.dkr.ecr.${aws_region}.amazonaws.com

          docker build -t $docker_repository/$fruit:latest .
          docker push $docker_repository/$fruit:latest
          docker rmi $docker_repository/$fruit:latest
      """
    } else {
      echo "No BUILD required"
    }
  }

  stage('deploy') {
    if(env.deploy == "true") {
      sh """
        ansible-playbook $fruit-local.yml
        ( cd $fruit/terraform
          terraform init
          terraform apply -auto-approve -refresh=true -target aws_dynamodb_table.dynamodb-terraform-state-lock -lock=false
          terraform apply -auto-approve -refresh=true
        )
        helm upgrade --install --namespace $namespace $fruit --debug $fruit/helm/$fruit
      """
    } else {
      echo "No DEPLOY required"
    }
  }
}
