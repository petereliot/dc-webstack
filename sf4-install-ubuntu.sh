#!/usr/bin/env bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
composer create-project symfony/skeleton sf4
cp .env ./sf4/.env