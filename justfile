build-db-tar-linux:
    docker buildx build . \
        --platform linux/amd64 \
        --tag codeconcise-db-linux \
        --output type=docker,dest=./codeconcise-db-linux.tar \
        --no-cache

build-db-tar-windows:
    docker buildx build . \
        --platform windows/amd64 \
        --tag codeconcise-db-windows \
        --output type=docker,dest=./codeconcise-db-windows.tar \
        --no-cache

run-db-tar:
    ./start_db.sh
