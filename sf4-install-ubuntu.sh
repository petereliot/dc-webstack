#!/usr/bin/env bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
composer create-project symfony/skeleton sf4
composer require doctrine maker
cp .env ./sf4/.env
cp web_profiler.yaml ./sf4/config/packages/dev/web_profiler.yaml