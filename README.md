# Setup [Minecraft bedrock server](https://www.minecraft.net/en-us/download/server/bedrock) with https://playit.gg

## Run bedrock server with playit
```
docker-compose up -d --force-recreate
```
or
```
docker compose up -d --force-recreate
```

## Check logs
```
docker-compose logs bedrock
docker-compose logs --follow bedrock
```

## Check local IP address
```
docker inspect bedrock
```

## Attach the console
```
docker attach bedrock
docker attach playit  # You need to attach playit to setup it.
```
> *CTRL-p* *CTRL-q* key sequence to detach

## Debug
```
docker-compose exec bedrock /bin/bash
docker-compose exec playit /bin/bash
docker image ls -a --no-trunc; docker-compose ps -a; docker inspect bedrock playit | jq -r '.[]|.Image+" "+.Name'; docker container ls -a #debug
```

## Shutdown bedrock server and playit
```
docker-compose down
```
or
```
docker compose down
```

## Build the Docker image manually (Optional)
```
DOCKER_BUILDKIT=1 BUILDKIT_PROGRESS=plain docker build . -t playit-bedrock --no-cache
```

### Debug playit setup problem (Optional)
```
docker run -it --rm -v $PWD/etc/playit:/etc/playit playit-bedrock playit
```
