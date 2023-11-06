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
					'''
					// This step should not normally be used in your script. Consult the inline help for details.
			withDockerContainer(image: 'mahmoudnobani/apache_server:1', toolName: 'docker') {
			    sh 'docker run -d --name apache-server -p 8899:80 mahmoudnobani/apache_server:1'
			}
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
