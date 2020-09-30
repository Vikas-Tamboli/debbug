pipeline{
  agent any

  parameters {
   choice(
       choices: ['apply' , 'destroy'],
       description: 'Perform action on infrastructure!',
       name: 'ACTION')
  
}  
  stages{
   stage("Opening"){
         steps{
            //Welcome message
            script{
               sh "cowsay 'Welcome to Jenkins'"
}
}
}

   stage("Workspace_cleanup"){
        //Cleaning WorkSpace
        steps{
            step([$class: 'WsCleanup'])
}
}

   stage("Repo_clone"){
       //Clone repo from GitHub
      steps {
         checkout ([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'instance_id', url:'git@github.com:shubh9975/sample.git']]])

}
}

   stage("terraform_init"){
     //terraform init
     steps{
      script{
       sh "bash plugins.sh"
}
}
}

   
   stage("static_analysis"){
     //static analysis
      steps{
       script{
       sh '''
            cd infra
            terraform validate 
            cd -
       '''
}
}
}   

   stage("terraform_plan"){
     //terraform plan
      steps{
       script{
       sh '''
            cd infra
            terraform plan 
            cd -
       '''        
}
}
}
 
   stage("terraform_apply"){
    //terraform apply
     when {
        //only terraform apply if a "apply" is requested
        expression { params.ACTION == 'apply'}
}
     steps{
      script{
       sh '''
            cd infra
            terraform apply -state-out=terraform.tfstate --auto-approve 
            cd -
       '''
   
}
}
}

   stage("terraform_destroy"){
    //terraform destroy
     when {
        //only terraform destroy if a "destroy" is requested
        expression { params.ACTION == 'destroy'}
}
     steps{
      script{
       sh '''
            cd infra
            terraform destroy -state-out=terraform.tfstate --auto-approve
            cd -
       '''                                                

}
}
}


}
} 

