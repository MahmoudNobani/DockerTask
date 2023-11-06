pipeline {
    agent none
    stages {
        stage('Build') {
	    agent         
		docker {
            	   image 'apache_server_agent'
            	}

            steps {
                echo "Building.."
                sh '''
                cd client
                ./t.sh
		cd ..
		ls -ltr
		docker info
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
