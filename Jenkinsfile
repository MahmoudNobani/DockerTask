pipeline {
    agent { 
        node {
            label 'docker_node'
            }
         }
    environment {
         DOCKERHUB_CREDENTIALS = credentials('mahmoudnobani')
        }
    triggers {
         pollSCM '*/2 * * * *'
        }
    stages {
        stage('Build server') {
            steps {
		script {
			echo "Building.."
			sh '''
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
                    sh '''
		    docker tag apache-server mahmoudnobani/apache_server:$BUILD_NUMBER
		    docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW 
		    docker push mahmoudnobani/apache_server:$BUILD_NUMBER
		    '''
             }
        }
        stage('Push client image') {
	    steps {
                    sh '''
		    docker tag client-server mahmoudnobani/client_server:$BUILD_NUMBER
		    docker push mahmoudnobani/client_server:$BUILD_NUMBER
		    '''
             }
        }
    }
}
