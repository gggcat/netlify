# netlify

## About

This is netlify-cli container.

## Usage

site list.

``` bash
docker-compose run netlify site
```

deploy live draft.

``` bash
docker-compose run netlify draft
```

deploy prod site.

``` bash
docker-compose run netlify deploy
```

## Environment

| ENV                    | VALUE                              |
| ---------------------- | ---------------------------------- |
| NETLIFY_AUTH_TOKEN     | auth token                         |
| NETLIFY_SITE_NAME      | site name                          |
| NETLIFY_PUBLISH_FOLDER | contents dir (nomaly: public)      |

## docker-compose.yml

``` yml
  public:
    image: zzzcat/netlify
    command: site
    tty: true
    volumes:
      - ./public:/netlify-work/public:rw
    environment:
      NETLIFY_AUTH_TOKEN: ${NETLIFY_AUTH_TOKEN}
      NETLIFY_SITE_NAME: ${NETLIFY_SITE_NAME}
      NETLIFY_PUBLISH_FOLDER: ${NETLIFY_PUBLISH_FOLDER}
```
