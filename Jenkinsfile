// pipeline {
//     agent any
//
//     stages {
//         stage('Installer dépendances') {
//             steps {
//                 powershell 'python --version'
//                 powershell 'python -m pip install --upgrade pip'
//                 powershell 'pip install -r requirements.txt'
//             }
//         }
//
//         stage('Exécuter les tests Robot Framework') {
//             steps {
//                 powershell 'robot --outputdir results tests/'
//             }
//         }
//     }
//
//     post {
//         always {
//             archiveArtifacts artifacts: 'results/**', fingerprint: true
//
//             // IMPORTANT : on donne le dossier, pas le fichier
//             robot outputPath: 'results',
//                   reportFileName: 'report.html',
//                   logFileName: 'log.html'
//         }
//     }
// }


//
// pipeline {
//     agent any
//
//     stages {
//
//         stage('Setup Python venv') {
//             steps {
//                 powershell '''
//                     python --version
//                     python -m venv venv
//                     .\\venv\\Scripts\\activate
//                     python -m pip install --upgrade pip
//                     pip install -r requirements.txt
//                 '''
//             }
//         }
//
//         stage('Run Robot Tests') {
//             steps {
//                 powershell '''
//                     .\\venv\\Scripts\\activate
//                     robot --outputdir results tests/
//                 '''
//             }
//         }
//     }
//
//     post {
//         always {
//             archiveArtifacts artifacts: 'results/**', fingerprint: true
//
//             robot outputPath: 'results',
//                   reportFileName: 'report.html',
//                   logFileName: 'log.html'
//         }
//     }
// }



pipeline {
    agent any

    stages {

        stage('Clean') {
            steps {
                deleteDir()
            }
        }

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
                powershell '.\\venv\\Scripts\\Activate.ps1; pip install -r requirements.txt'
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