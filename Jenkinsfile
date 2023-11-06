pipeline {
	agent any

	environment {
        	DOCKER_TLS_VERIFY = 0
    	}
      
    stages {
        stage('Build') {
            steps {
		script {
			echo "DOCKER_HOST = ${DOCKER_HOST}"
			echo "DOCKER_TLS_VERIFY = ${DOCKER_TLS_VERIFY}"
			echo "Building.."
			sh '''
			cd client
			./t.sh
			cd ..
			ls -ltr

			docker build  -t apache-server .
			echo "docker built"
			docker run -d --name apache-server -p 8899:80 apache-server
				'''
		}
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
