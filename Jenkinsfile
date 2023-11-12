pipeline {
    agent any

    stages {
        stage('Mantenimiento de la database') {
            steps {
                script {
                    // Se descarga la base de datos Employees.db
                    sh 'wget -O Employees.db https://github.com/Luckvill/PROF-2023-Ejercicio4/blob/main/Employees.db'

                    // Se hace una copia de los datos actuales
                    sh 'sqlite3 Employees.db ".dump" > Backup.sql'

                    // Se elimina el esquema actual y se carga el nuevo esquema
                    sh 'sqlite3 Employees.db < sqlite.sql'

                    // Se Restauran los datos respaldados anteriormente
                    sh 'sqlite3 Employees.db < Backup.sql'
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
