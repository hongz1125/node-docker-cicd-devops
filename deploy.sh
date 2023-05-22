#! /bin/sh
TIME=$(date "+%Y%m%d_%H%M%S")

projectName='cicd-web'

if [ ! -d "www/$projectName" ];then
    echo 'git clone'
    cd www
    git clone git@github.com:hongz1125/node-docker-cicd-devops2.git $projectName
else
    echo 'git pull'
    cd www/$projectName
    git pull origin master
fi

docker stop $projectName
docker rm -f $projectName
docker rmi -f $projectName
docker build -t $projectName .
docker run --name=$projectName -d -p 9001:9001 $projectName