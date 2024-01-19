pipeline {
  agent any
  stages {
    stage('Backup of DB') {
      steps {

        echo 'Borrar anteriores backups'
        sh 'sudo rm backup.sql'

        echo 'backup de la current db'
        sh 'sudo sqlite3 Employees.db ".mode insert" ".output backup.sql" ".dump" ".quit"'
        echo '1'
      }
    }

    stage('Delete the DB') {
      steps {
        sh 'sudo rm Employees.db'
      }
    }

    stage('Load new schema') {
      steps {
        sh 'sudo sqlite3 Employees.db < sqlite.sql'
      }
    }

    stage('Restore data') {
      steps {
        sh 'sudo sqlite3 Employees.db .read backup.sql .quit'
      }
    }

  }
}
