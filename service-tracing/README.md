## Environment

Please follow the instruction below:

> copy `.env-example` to `.env`


## How to run service tracing

The first time we need to generate certificates

```bash
docker-compose -f docker-compose-certs-elk.yml run --rm certs-elk
```

up service tracing

```bash
docker-compose up -d
```

down service tracing

```
docker-compose down
```
