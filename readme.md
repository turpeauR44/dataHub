# local-dev-richemont



## Getting started

To get started, compose the dockerfiles with:
```bash 
docker login registry.gitlab.com/libremfg
docker compose up
```

Docker login credentials are the gitlab deploy token

Once service is up, run:

```bash 
docker compose run --rm schema-init
```

Optional:
If schema changed, reconstruct supergraph by running
```bash
docker compose run --rm apollo-rover
docker restart apollo-router
```

## Populate Test Dataset

Populate test dataset with
```bash
./example-data/example-data-darwin
OR
./example-data/example-data-linux
OR
./example-data/example-data-windows.exe
```