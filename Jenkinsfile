pipeline {
    agent none
    stages {
        stage('Build') {
	    agent any
            steps {
                echo "Building.."
                sh '''
                cd client
                ./t.sh
		./server.sh
                '''
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
