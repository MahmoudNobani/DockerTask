pipeline {
	agent any
    stages {
        stage('Build') {
            steps {
				script {
					echo "Building.."
					sh '''
					cd client
					./t.sh
					cd ..
					ls -ltr

					docker build -v /var/run/docker.sock:/var/run/docker.sock -t apache-server .
					echo "docker built"
					docker run -v /var/run/docker.sock:/var/run/docker.sock -d --name apache-server -p 8899:80 apache-server
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
