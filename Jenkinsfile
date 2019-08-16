pipeline {
    
    agent any

    parameters{
        string(name: 'GIT_SOURCE_PATH', defaultValue: "https://github.com/tavisca-spanda/WebApiDemo.git")
        string(name: 'TEST_PATH', defaultValue: "XUnitTestProject1/WebApiDemoTest.csproj")
        string(name: 'FILE_SOURCE_PATH', defaultValue: "WebApiDemo.sln")
        choice(name: 'JOB', choices: ['Build', 'Test'], description: 'Providing Choices' )
    }
    stages {
        
        stage('--build--') {
            steps {
                sh "dotnet restore ${FILE_SOURCE_PATH} --source https://api.nuget.org/v3/index.json"
                sh "dotnet build ${FILE_SOURCE_PATH} -p:Configuration=release -v:n" 
            }
        }
        stage('--test--') {

            when 
		    { 
			    expression { params.JOB == 'Test'}
		    }
            steps {
                sh 'dotnet build ${SOLUTION_PATH} -p:Configuration=release -v:n'
                sh "dotnet test ${TEST_PATH}"
            }
        }

        stage('---Publish---')
        {
            steps{
             sh 'dotnet publish'   
            }
            
        }
    }

    post
    {
        always{
         archiveArtifacts '**'
            sh 'dotnet webapi/bin/Debug/netcoreapp2.2/webapi.dll'
            
        }
        
        
    }
}