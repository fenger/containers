
# Clickhouse

Build clickhouse image with initialization data.

# Usage

## build
```
docker build -t my-ch:v1 .
```

## run
```
docker run -d --name mych --ulimit nofile=262144:262144 my-ch:v1
```

