pipeline {
    agent any

    stages {
        stage('Mantenimiento de la database') {
            steps {
                script {
                    // Se descarga la base de datos Employees.db
                    sh 'wget -O Employees1.db https://github.com/Luckvill/PROF-2023-Ejercicio4/blob/main/Employees.db'
                }
            }
        }
    }

    post {
        success {
            script {
                echo 'The database maintenance was successful'
            }
        }
        failure {
            script {
                echo 'The database maintenance was failed'
            }
        }
    }
    
}
