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
		cd ..
		ls -ltr
		docker build -t apache-server .
		echo "docker built"
		docker run -d --name apache-server -p 8899:80 apache-server
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
