#!/usr/bin/env bash
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony
symfony new sf3 3.3
chmod -R 777 sf3/var/{cache,logs,sessions}
cp parameters.yml sf3/app/config/parameters.yml
cp config.yml sf3/app/config/config.yml
#docker-compose stop
#docker-compose up --build --force-recreate
