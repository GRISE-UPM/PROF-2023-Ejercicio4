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
    }

    post {
        success {
            script {
                def commitSHA = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                echo 'The database maintenance was successful'
                // Enviar statuscheck exitoso a GitHub
                withCredentials([string(credentialsId: 'TOKEN_JENKINS', variable: 'GITHUB_TOKEN')]) {
                    sh """
                    curl -X POST \
                    -H "Authorization: token ${GITHUB_TOKEN}" \
                    -H "Accept: application/vnd.github.v3+json" \
                    -d '{"state": "success", "description": "Database maintenance successful", "context": "Jenkins"}' \
                    https://api.github.com/repos/Luckvill/PROF-2023-Ejercicio4/statuses/commitSHA
                    """
                }
            }
        }
        failure {
            script {
                def commitSHA = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                echo 'The database maintenance was failed'

                // Enviar statuscheck fallido a GitHub
                withCredentials([string(credentialsId: 'TOKEN_JENKINS', variable: 'GITHUB_TOKEN')]) {
                    sh """
                    curl -X POST \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github.v3+json" \
                    -d '{"state": "failure", "description": "Database maintenance failed", "context": "Jenkins"}' \
                    https://api.github.com/repos/Luckvill/PROF-2023-Ejercicio4/statuses/${commitSHA}
                    """
                }
            }
        }
    }
    
}
