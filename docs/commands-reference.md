# Commands Reference

Useful basic commands and their purposes related to the Docker setup in this codebase.

## Docker Basics
- `docker ps`: List active running containers to verify status.
- `docker logs <container>`: View live output from a single container.
- `docker exec -it <container> sh`: Open a shell session inside a running container.

## Compose Commands
- `docker compose up -d --build`: Rebuilds the images if necessary and starts the stack detached.
- `docker compose down`: Halts and removes the containers.
- `docker compose restart`: Soft restarts the services without destroying them.

## Cleanup
- `docker image prune -af`: Forcefully removes unused images.
- `docker container prune -f`: Removes all stopped containers.

*Note: All these concepts have been modularized in the `/scripts` directory.*
