pipeline {
    agent any

    stages {
        stage('Backup') {
            steps {
                echo 'Backup de la DB'
                sh '''
                        sqlite3 Employees.db <<EOF
                        -- Your SQLite commands here
                        .dump > sqlite.sql
                        EOF
                    '''
            }
        }
        
        stage('Delete DB') {
            steps {
                echo 'Eliminación del esquema actual'
            }
        }
        
        stage('Load Schema') {
            steps {
                echo 'Carga del nuevo esquema'
            }
        }
        
        stage('Restore Data') {
            steps {
                echo 'Restauración datos'
            }
        }
    }
}
