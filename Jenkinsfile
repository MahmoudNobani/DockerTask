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
        stage('Docker Push') {
	    steps {
	       withCredentials([usernamePassword(credentialsId: 'mahmoudnobani', passwordVariable: 'mahmoudnobaniPassword', usernameVariable: 'mahmoudnobaniUser')]) {	
                   sh '''echo ${env.mahmoudnobaniUser} 
		   echo "   "
		   echo ${env.mahmoudnobaniPassword}'''

	           }
             }
        }
    }
}
