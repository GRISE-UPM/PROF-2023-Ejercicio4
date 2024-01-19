pipeline {
  agent any
  stages {
    stage('Backup of DB') {
      steps {


        echo 'backup de la current db'
        sh 'sqlite3 Employees.db ".mode insert" ".output backup.sql" ".dump" ".quit"'
        echo '1'
      }
    }

    stage('Delete the DB') {
      steps {
        sh 'rm Employees.db'
      }
    }

    stage('Load new schema') {
      steps {
        sh 'sqlite3 Employees.db < sqlite.sql'
      }
    }

    stage('Restore data') {
      steps {
        sh 'sqlite3 Employees.db .read backup.sql .quit'
      }
    }

  }
}
