#!/usr/bin/env bash

hugo && rsync -avz --delete public/ root@45.76.157.38:~/container/haphan.cf/
