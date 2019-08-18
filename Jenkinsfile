pipeline {
     agent any
     
    parameters{
     string(name:'APPLICATION_PATH',defaultValue:'WebApiDemo.sln')
<<<<<<< HEAD
     string(name:'IMAGE_VERSION',defaultValue:'latest')  
=======
     string(name:'IMAGE_NAME',defaultValue:'subhransu')  
>>>>>>> 67dd3e77050bd8ec09f265c2795a78d85550e222
     string(name: 'NUGET_REPO', defaultValue: 'https://api.nuget.org/v3/index.json')
     string(name: 'GIT_REPO_PATH', defaultValue: 'https://github.com/tavisca-spanda/WebApiDemo.git')
     string(name: 'SOLUTION_NAME', defaultValue: 'WebApiDemo')
     string(name: 'APPLICATION_TEST_PATH', defaultValue: 'XUnitTestProject1/WebApiDemoTest.csproj')
     string(name: 'DOCKER_USERNAME', defaultValue: 'subhransup44')
     string(name: 'DOCKER_PASSWORD',defaultValue:'b0b_the_builder')
     string(name: 'DOCKER_REPO_NAME',defaultValue:'subhransup44/WebApiDemo')
      
    }
    
   
       stages {
        
        stage('Build') {
            steps {
              
                powershell(script: 'dotnet build $APPLICATION_PATH -p:Configuration=release -v:n')
                powershell(script: 'dotnet test $APPLICATION_TEST_PATH')
                powershell(script: 'dotnet publish $APPLICATION_PATH -c Release -o ../publish')
                powershell(script: 'docker build -t $DOCKER_REPO_NAME:$IMAGE_VERSION --build-arg project_name=$SOLUTION_NAME.dll .')
   
               
            }
        }
<<<<<<< HEAD
        
        
        
=======
        stage('Publish')
        {
            steps{
            powershell(script: 'dotnet publish $APPLICATION_PATH -c Release -o artifacts')
            }
            
        }
           stage('Archive')
        {
            steps
            {
             powershell(script: 'compress-archive WebAPiDemo/artifacts publish.zip -Update')
                archiveArtifacts artifacts: 'publish.zip' 
            }
        }
>>>>>>> 67dd3e77050bd8ec09f265c2795a78d85550e222
           stage('deploy') {
            steps {
                       
                powershell(script: 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD')
                powershell(script: 'docker push $DOCKER_REPO_NAME:$IMAGE_VERSION')
                 
            }
        }
           
    }
    
}
