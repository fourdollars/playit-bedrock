# Setup Minecraft bedrock server with https://playit.gg

## Run bedrock server with playit
```
docker-compose up -d
```
or
```
docker compose up -d
```

## Check logs
```
docker-compose logs bedrock
docker-compose logs --follow bedrock
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
