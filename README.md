下準備
docker build -t sinatra/hello

1. docker-compose up -d
2. docker-compose exec manage swarm init
`これでJOINトークンが生成される。`
3. docker-compose exec worker01 docker swarm join --token `生成されたトークン`
4. docker-compose exec worker02 docker swarm join --token `生成されたトークン`
5. docker-compose exec worker03 docker swarm join --token `生成されたトークン`
6. docker-compose exec manage docker node ls

イメージのpush
docker image tag sinatra/hello:latest localhost:5000/sinatra/hello:latest
docker image push registry:5000/sinatra/hello:latest

各コンテナでイメージをpull
docker-compose exec worker01 docker image pull registry:5000/sinatra/hello:latest
docker-compose exec worker02 docker image pull registry:5000/sinatra/hello:latest
docker-compose exec worker03 docker image pull registry:5000/sinatra/hello:latest