#!/usr/bin/env bash

docker run -it -d \
    --name haphan-cf \
    -e VIRTUAL_HOST=haphan.cf -v ~/container/haphan.cf:/usr/share/nginx/html:ro \
    nginx:stable-alpine