# MySQL
Build mysql image with initialization data.

# Usage

## Build
```bash
docker build -t my-mysql:v1 .
```

## Run
```bash
docker run --name ctm-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d my-mysql:v1 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```
