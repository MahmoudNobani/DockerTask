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
			withDockerRegistry(credentialsId: 'mahmoudnobani', url: 'https://hub.docker.com/r/mahmoudnobani/apache_server/tags') {
			    sh "docker build -t mahmoudnobani/apache_server:latest"
			    sh "docker push"
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
