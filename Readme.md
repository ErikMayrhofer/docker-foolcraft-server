# Foolcraft Server
This is an unofficial Docker-Image for the [Foolcraft](https://www.curseforge.com/minecraft/modpacks/foolcraft-3) 3 Minecraft server.

## Usage
Use the image

```
https://cloud.docker.com/repository/docker/obyoxar/foolcraft-server/general
```

and a docker-compose.yml like this
```
version: "3"

volumes:
  minecraft:

services:
  foolcraft:
    image: obyoxar/foolcraft-server:latest
    environment:
      - USER_ID=1010
    ports:
      - 25565:25565
    volumes:
      - minecraft:/minecraft
```

## Environment Variables and Default values
* USER_ID 1000
* USER_NAME fool
* USER_HOME /minecraft
* MODPACK_URL https://media.forgecdn.net/files/2642/141/FoolCraft+3+-++Server+Files+-+1.6.zip