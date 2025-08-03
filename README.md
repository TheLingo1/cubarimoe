# Cubari.moe
An image proxy powered by the Cubari reader.

This is my modified version that makes dockerization and self-hosting easier

## Deploying
Just build the image using
```
docker build -t ghcr.io/USERNAME/cubarimoe:latest .
```
then push it to ghcr
```
docker push ghcr.io/USERNAME/cubarimoe:latest
```

Afterwards pull the image and run it on your server. It will be listening on port 8000 on the container so map that to your host port and access it from there.


## Other info
Relevant URLs (as of now): 

- `/` - home page
- `/admin` - admin view (login with created user above)
- `/admin_home` - admin endpoint for clearing the site's cache
