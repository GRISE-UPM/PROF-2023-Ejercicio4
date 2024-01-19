pipeline {
  agent any
  stages {
    stage('Copia de la Base de datos') {
      steps {


        echo 'Copia de la base de datos'
        sh 'sqlite3 Employees.db ".mode insert" ".output backup.sql" ".dump" ".quit"'
        
      }
    }

    stage('Eliminar la Base de datos') {
      steps {
        echo 'Eliminar la base de datos'
        sh 'rm Employees.db'
      }
    }

    stage('Cargar nuevo schema') {
      steps {
        echo 'Cargar nuevo schema'
        sh 'sqlite3 Employees.db < sqlite.sql'
      }
    }

    stage('Restaurar Datos') {
      steps {
        echo 'Restaurar Datos'
        sh 'sqlite3 Employees.db ".read |backup.sql" ".quit"'
      }
    }

  }
}
