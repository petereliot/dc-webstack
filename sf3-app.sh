#!/usr/bin/env bash
sudo apt install php -y
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
symfony new sf3 3.3
sudo chmod -R 777 ./sf3/var/{cache,logs,sessions}
cp parameters.yml ./sf3/app/config/parameters.yml
cp config.yml ./sf3/app/config/config.yml
#docker-compose stop
#docker-compose up -d --force-recreate
