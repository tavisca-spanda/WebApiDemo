pipeline {
     agent any
     
    parameters{
     string(name:'APPLICATION_PATH',defaultValue:'WebApiDemo.sln')
     string(name:'IMAGE_VERSION',defaultValue:'latest')  
     string(name: 'NUGET_REPO', defaultValue: 'https://api.nuget.org/v3/index.json')
     string(name: 'GIT_REPO_PATH', defaultValue: 'https://github.com/tavisca-spanda/WebApiDemo.git')
     string(name: 'SOLUTION_NAME', defaultValue: 'WebApiDemo')
     string(name: 'APPLICATION_TEST_PATH', defaultValue: 'XUnitTestProject1/WebApiDemoTest.csproj')
     string(name: 'DOCKER_USERNAME', defaultValue: 'subhransup44')
     string(name: 'DOCKER_PASSWORD',defaultValue:'b0b_the_builder')
     string(name: 'DOCKER_REPO_NAME',defaultValue:'subhransup44/webapidemo')
         
      
    }
     
    
   
       stages {
        
        stage('Build') {
            steps {
              
                powershell(script: 'dotnet C:/sonar-scanner-msbuild-4.6.2.2108-net46/SonarScanner.MSBuild.dll begin /k:"WebApiDemo" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="b4911aac97e41c59f9ce831cf579c8fea374957a"')
                powershell(script: 'dotnet build $APPLICATION_PATH -p:Configuration=release -v:n')
                powershell(script: 'dotnet test $APPLICATION_TEST_PATH')
                powershell(script:'dotnet C:/sonar-scanner-msbuild-4.6.2.2108-net46/SonarScanner.MSBuild.dll end /d:sonar.login="b4911aac97e41c59f9ce831cf579c8fea374957a"')
                powershell(script: 'dotnet publish $APPLICATION_PATH -c Release -o ../publish')

                 powershell(script: 'docker build -t $DOCKER_REPO_NAME:$IMAGE_VERSION --build-arg project_name=$SOLUTION_NAME.dll .')
   
               
            }
        }

        
           stage('deploy') {
            steps {
                       
                 powershell(script: 'winpty docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD')
                 powershell(script: 'docker push $DOCKER_REPO_NAME:$IMAGE_VERSION')
                 
                 
            }
        }
           
    }
    
}
