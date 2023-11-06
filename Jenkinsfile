pipeline {
	agent { 
        node {
            label 'docker_node'
            }
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
			./server.sh
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
