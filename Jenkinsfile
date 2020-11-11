env.DOCKER_REGISTRY = 'indradock'
env.DOCKER_IMAGE_NAME = 'pesbuk-app'
pipeline {
    agent any
    stages {
        stage('docker build image') {
            steps {
                sh('sed -i "s/versi/$BUILD_NUMBER/g" index.php')
                sh "docker build --build-arg APP_NAME=$DOCKER_IMAGE_NAME -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER ."
                }
           }
        stage('docker push image') {
            steps {                
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
        stage('versi image') {
            steps {
                sh('sed -i "s/versi/$BUILD_NUMBER/g" pesbuk.yml')
                }
           }
        stage('change namespace') {
            steps {
                sh('sed -i "s/default/production/g" pesbuk.yml')
                }
           }
        stage('set domain') {
            steps {
                sh('sed -i "s/pesbuk.indraku.online/pesbuk.indraku.online/g" pesbuk.yml')
                }
           }
        stage('deploy ke kubernetes') {
            steps {
                sh('kubectl apply -f pesbuk.yml')
                }
           }
        stage('remove image docker') {
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
         stage('show ingress') {
            steps {
                sh('kubectl get ingress -n=pesbuk')
                }
           }        
      }
}
