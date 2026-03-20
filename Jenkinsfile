pipeline {
    agent any

    stages {
        stage('Installer dépendances') {
            steps {
                powershell 'python --version'
                powershell 'python -m pip install --upgrade pip'
                powershell 'pip install -r requirements.txt'
            }
        }

        stage('Exécuter les tests Robot Framework') {
            steps {
                powershell 'robot --outputdir results tests/'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true

            // IMPORTANT : on donne le dossier, pas le fichier
            robot outputPath: 'results',
                  reportFileName: 'report.html',
                  logFileName: 'log.html'
        }
    }
}