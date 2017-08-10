# Docker compose webstack

> ## A docker compose LAMP stack (comprising phpmyadmin and mailhog)

### Containers

- container 1:

    **3wa-proxy** serving as proxy server for naming resolutions
    
- container 2:

    **3wa-api** running php and apache

    accessible at `api.3wa.lo` or on port 81 at http://127.0.0.1:81

- container 3:

    **3wa-mysql** (latest 5.7) official docker image:
    
    `user: root password: password`
 
    launched on port 3307 on the host machine (in order not to interfere with already mysql server listening)
    
    `mysql -h 127.0.0.1 -u root --port=3307 -ppassword`

- container 4:

    **3wa-pma** using official phpmyadmin image

    accessible at `pma.3wa.lo` or on port 8181 at http://127.0.0.1:8181
    
- container 5:

    **3wa-mail** using official mailhog image

    accessible at `mail.3wa.lo` or on port 8026 at http://127.0.0.1:8026
    
### Updating your host environment

:bulb: Add the following entries in your /etc/hosts files

```
127.0.0.1	pma.3wa.lo
127.0.0.1	mail.3wa.lo
127.0.0.1	api.3wa.lo
```

### Building the stack

:bulb: You must have git, docker and docker-compose installed before

```bash
git clone https://github.com/chisNaN/dc-webstack
cd dc-webstack
git checkout 3wa
docker-compose up
```

You may execute [http://api.3wa.lo/test-mail.php](http://api.3wa.lo/test-mail.php) to send a test email.

### PHP & apache configuration (of the 3wa-api container)

- Short open tag set to "On"

```bash
RUN sed -i -E 's#short_open_tag = (On|Off)#short_open_tag = On#' /etc/php/7.0/apache2/php.ini
```

- Display errors set to "On"

```bash
RUN sed -i -E 's#display_errors = (On|Off)#display_errors = On#' /etc/php/7.0/apache2/php.ini
```

- Error notice set to "Off"

```bash
RUN sed -i -e 's#error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT#error_reporting = E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED#' /etc/php/7.0/apache2/php.ini
```

:bulb: JavaScript fetch(); global can be tricky with some browsers returning `Access-Control-Allow-Origin` errors (even in same domain requests).
So we enabled **ALL origins** in apache headers configuration.

```bash
RUN sed -i '10i\\tHeader set Access-Control-Allow-Origin "*"' /etc/apache2/sites-available/000-default.conf
```

(Feel free to modify the `webserver/Dockerfile` file to add any other specific configuration)


### Troubleshooting

If the 3wa-api shows Exit 0 when running `docker-compose ps` (after `docker-compose restart`)

just run: `docker-compose up -d --force-recreate --build`

If you need to retrieve the IP of a container
 
`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 3wa-rabbit`

If you need to inspect the logs of a specific container

`docker logs 3wa-api`

### Docker info commands

`docker-compose ps`

`docker stats $(docker ps --format '{{.Names}}')`
