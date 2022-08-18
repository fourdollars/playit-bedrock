# Setup Minecraft bedrock server with https://playit.gg

## Build the Docker image
```
DOCKER_BUILDKIT=1 docker build . -t minecraft-bedrock-playit-gg
```

## Generate etc/playit/playit.toml
```
docker run -it --rm -v $PWD/etc/playit:/etc/playit minecraft-bedrock-playit-gg playit
```

## Run bedrock server with playit
```
docker-compose up -d
```

## Check logs
```
docker-compose logs bedrock
docker-compose logs --follow bedrock
docker-compose logs playit
docker-compose logs --follow playit
```
