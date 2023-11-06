pipeline {
    agent none
    stages {
        stage('Build') {
	    agent any
            steps {
                echo "Building.."
                sh './server'
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh './test.sh'
            }
        }
    }
}
