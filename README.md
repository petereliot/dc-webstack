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
    
    ```
    user: root
    password: password
    ```

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

### Troubleshooting

If you need to retrieve the IP of a container
 
`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 3wa-rabbit`

If the 3wa-api shows Exit 0 when running `docker-compose ps` (after `docker-compose restart`)

just run: `docker-compose up -d --force-recreate --build`

If you need to inspect the logs of a specific container

`docker logs 3wa-api`

### Docker info commands

`docker-compose ps`

`docker stats $(docker ps --format '{{.Names}}')`
