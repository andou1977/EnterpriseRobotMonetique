pipeline {
    agent any

    stages {

        stage('Debug Env') {
            steps {
                powershell 'python --version'
                powershell 'pip --version'
            }
        }

        stage('Setup venv') {
            steps {
                powershell 'python -m venv venv'
                powershell '.\\venv\\Scripts\\Activate.ps1; python -m pip install --upgrade pip'
                powershell '.\\venv\\Scripts\\Activate.ps1; python -m pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                powershell '.\\venv\\Scripts\\Activate.ps1; robot --outputdir results tests/'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true

            robot outputPath: 'results',
                  reportFileName: 'report.html',
                  logFileName: 'log.html'
        }
    }
}

