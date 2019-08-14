pipeline {
    
    agent any

    parameters{
        string(name: 'GIT_SOURCE_PATH', defaultValue: "https://github.com/tavisca-spanda/MyWebserver.git")
        string(name: 'TEST_PATH', defaultValue: "XUnitTestProject1/WebApiDemoTest.csproj")
        string(name: 'FILE_SOURCE_PATH', defaultValue: "WebApiDemo.sln")
    }
    stages {
        
        stage('--build--') {
            steps {
                sh "dotnet restore ${FILE_SOURCE_PATH} --source https://api.nuget.org/v3/index.json"
                sh "dotnet build ${FILE_SOURCE_PATH} -p:Configuration=release -v:n" 
            }
        }
        stage('--test--') {
            steps {
                sh "dotnet test ${TEST_PATH}"
            }
        }
    }
}