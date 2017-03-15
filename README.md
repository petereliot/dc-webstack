# Docker compose webstack

### Containers

- container 1:

    **hf-api** (ubuntu:16.10) official docker image

    accessible at `api.hf.lo` or on port 81 at http://127.0.0.1:81

- container 2:

    **hf-mysql** (latest 5.7) official docker image:
    
    user: root
    password: password

- container 3:

    **hf-rabbit** (3.6-management) official docker image
    
    web management interface accessible at `rabbit.hf.lo` or on port 15672 at http://127.0.0.1:15672

- container 4:

    **hf-pma** using official phpmyadmin image

    accessible at `pma.hf.lo` or on port 8181 at http://127.0.0.1:8181
    
- container 5:

    **hf-mail** using official mailhog image

    accessible at `mail.hf.lo` or on port 8026 at http://127.0.0.1:8026
    
### Updating your /etc/hosts file

Add the following entries

```
127.0.0.1	pma.hf.lo
127.0.0.1	mail.hf.lo
127.0.0.1	api.hf.lo
127.0.0.1	rabbit.hf.lo
```

### Building the stack

You must have git, docker and docker-compose installed before

`git clone https://github.com/chisNaN/dc-webstack`

`cd dc-webstack`

`docker-compose up -d`

###Running a symfony application

`chmod 777 sf3-app.sh`

`./sf3-app.sh`

###Communicating from host OS with symfony console

Will list all avaiblable symfony commands

`docker exec -ti hf-api /var/www/html/bin/console`

Will create the symfony database

`docker exec -ti hf-api /var/www/html/bin/console do:da:cr`

Will clear the cache for your prod env (in case of error)

`docker exec -ti hf-api /var/www/html/bin/console ca:cl -e prod`

Will send a test email to mailhog with swiftmailer

`docker exec -ti hf-api /var/www/html/bin/console sw:em:se --from=foo@bar --to=just@do --subject=test --body=works`

### Troubleshooting

If you need to retrieve the IP of a container
 
`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' hf-rabbit`

If the hf-api shows Exit 0 when running `docker-compose ps` (after `docker-compose restart`)

just run: `docker-compose up -d --force-recreate --build`

If you need to inspect the logs of a specific container

`docker logs hf-api`

### Optional docker commands

`docker-compose ps`

`docker stats $(docker ps --format '{{.Names}}')`
