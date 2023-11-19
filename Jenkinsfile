pipeline {
    agent any

    stages {
        stage('Mantenimiento de la database') {
            steps {
                script {
                    // Se descarga la base de datos Employees.db
                    sh 'wget -O Employees.db https://github.com/Luckvill/PROF-2023-Ejercicio4/raw/main/Employees.db'
                    
                    // Se hace una copia de los datos actuales
                    sh 'sqlite3 Employees.db ".dump" > Backup.sql'

                    // Se elimina el esquema actual
                    sh 'rm Employees.db'
                    
                    // Se elimina el esquema actual y se carga el nuevo esquema
                    sh 'sqlite3 Employees.db < sqlite.sql'
                    
                    // Se Restauran los datos respaldados anteriormente
                    sh 'grep -E "INSERT" Backup.sql | sqlite3 Employees.db' 
                }
            }
        }
        stage('Build and Test') {
            steps {
                script {
                    // Your build and test steps go here

                    // Simulate the result of your build and test
                    def buildStatus = 'SUCCESS' // or 'FAILURE' or 'PENDING'
                    def context = 'ci-check' // This can be any unique identifier for your status check

                    updateGitHubStatus(buildStatus, context)
                }
            }
        }
    }
}

def updateGitHubStatus(buildStatus, context) {
    // Replace these variables with your GitHub repository and token
    def repoOwner = 'Luckvill'
    def repoName = 'PROF-2023-Ejercicio4'
    def commitSHA = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()

    // GitHub token with repo status scope
    def githubToken = 'TOKEN_JENKINS'

    // Set the GitHub API URL
    def apiUrl = "https://api.github.com/repos/${repoOwner}/${repoName}/statuses/${commitSHA}"

    // Map Jenkins status to GitHub status
    def stateMap = [
        'SUCCESS': 'success',
        'FAILURE': 'failure',
        'PENDING': 'pending'
    ]

    // Set the GitHub status context and description
    def statusContext = context
    def statusDescription = "Jenkins CI - ${buildStatus}"

    // Set the GitHub status state based on the Jenkins build status
    def statusState = stateMap[buildStatus]

    // Create the payload for the GitHub Status API
    def statusPayload = [
        state: statusState,
        target_url: 'URL_TO_YOUR_CI_JOB_LOGS',
        description: statusDescription,
        context: statusContext
    ]

    // Send a POST request to update the GitHub status
    def response = httpRequest(
        acceptType: 'APPLICATION_JSON',
        contentType: 'APPLICATION_JSON',
        httpMode: 'POST',
        requestBody: statusPayload,
        authentication: "your-github-token:${githubToken}",
        url: apiUrl
    )

    echo "GitHub Status API Response: ${response}"
    }
