# Gatling

This contains a basic Docker image for [Gatling](https://gatling.io).

## Building

Run `build.sh` to build the container.

## Environment Config

- `GATLING_BASE_URL` Base url for website to test. It's a good idea to use this to make
 your tests portable between environments.

## Running

```
docker run --rm -t -i \
  -e GATLING_BASE_URL=${GATLING_BASE_URL} \
  -v $(pwd)/user-files:/opt/gatling/user-files \
  -v $(pwd)/results:/opt/gatling/results \
  panubo/gatling $@
```
