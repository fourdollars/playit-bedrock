# Setup Minecraft bedrock server with https://playit.gg

## Build the Docker image (Optional)
```
DOCKER_BUILDKIT=1 BUILDKIT_PROGRESS=plain docker build . -t playit-bedrock --no-cache
```

## Generate etc/playit/playit.toml (One time setup)
```
mkdir -p /etc/playit
```
### Use Docker Hub Container registry
```
docker run -it --rm -v $PWD/etc/playit:/etc/playit fourdollars/playit-bedrock playit
```
### Use GitHub Container registry
```
docker run -it --rm -v $PWD/etc/playit:/etc/playit ghcr.io/fourdollars/playit-bedrock playit
```
### Use local build
```
docker run -it --rm -v $PWD/etc/playit:/etc/playit playit-bedrock playit
```
> *CTRL-c* *CTRL-c* key sequence to quit

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
docker attach docker-bedrock-server-1
docker attach docker-bedrock-playit-1
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
