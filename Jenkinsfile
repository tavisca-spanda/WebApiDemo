pipeline {
     agent any
     
    parameters{
     string(name:'APPLICATION_PATH',defaultValue:'WebApiDemo.sln')
     string(name:'IMAGE_VERSION',defaultValue:'latest')  
     string(name: 'NUGET_REPO', defaultValue: 'https://api.nuget.org/v3/index.json')
     string(name: 'GIT_REPO_PATH', defaultValue: 'https://github.com/tavisca-spanda/WebApiDemo.git')
     string(name: 'SOLUTION_NAME', defaultValue: 'WebApiDemo')
     string(name: 'APPLICATION_TEST_PATH', defaultValue: 'XUnitTestProject1/WebApiDemoTest.csproj')
     string(name: 'DOCKER_REPO_NAME',defaultValue:'subhransup44/WebApiDemo')
      
    }
     
     environment {
        DOCKER_USERNAME = 'subhransup44'
        DOCKER_PASSWORD = 'b0b_the_builder'
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

        
           stage('deploy') {
            steps {
                       
                 powershell(script: 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD')
                 powershell(script: 'docker push $DOCKER_REPO_NAME:$IMAGE_VERSION')
                 
            }
        }
           
    }
    
}
