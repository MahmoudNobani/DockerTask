pipeline {
	agent { 
        node {
            label 'docker_node'
      }
      
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
