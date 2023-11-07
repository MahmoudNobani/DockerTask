pipeline {
    agent { 
        node {
            label 'docker_node'
            }
         }
    environment {
         DOCKERHUB_CREDENTIALS = credentials('mahmoudnobani')
      }
    stages {
        stage('Build server') {
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
        stage('Testing server') {
            steps {
                echo "Testing.."
                sh './test.sh'
            }
        }
	stage('Build client') {
            steps {
		script {
			echo "Building client"
			sh '''
			cd client
			./cli.sh
			'''
		}
            }
        }
        stage('Testing client') {
            steps {
                echo "Testing client"
                sh '''
		cd client
		./val.sh'''
            }
        }
        stage('Push server image') {
	    steps {
                    sh '''echo $BUILD_NUMBER
		    docker tag apache-server mahmoudnobani/apache_server:$BUILD_NUMBER
		    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
		    docker push mahmoudnobani/apache_server:$BUILD_NUMBER
		    '''
             }
        }
        stage('Push client image') {
	    steps {
                    sh '''echo $BUILD_NUMBER
		    docker tag client-server mahmoudnobani/client_server:$BUILD_NUMBER
		    docker push mahmoudnobani/client_server:$BUILD_NUMBER
		    '''
             }
        }
    }
}
