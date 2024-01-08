pipeline {
  agent any
  stages {
    stage('Backup of DB') {
      steps {
        sqlite3 Employees.db .mode insert .output newBackup.sql .dump .quit
        grep INSERT INTO newBackup.sql > backup.sql
        echo '1'
      }
    }

    stage('Delete the DB') {
      steps {
        rm Employees.db
        echo '2'
      }
    }

    stage('Load new schema') {
      steps {
        sqlite3 Employees.db < sqlite.sql
        echo '3'
      }
    }

    stage('Restore data') {
      steps {
        sqlite3 Employees.db .read backup.sql .quit
        echo '4'
      }
    }

  }
}
