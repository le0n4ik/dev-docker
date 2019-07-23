#!/usr/bin/env bash
docker-compose exec app bash -c 'rm -rf generated/*'
docker-compose exec app composer install
docker-compose exec app php bin/magento setup:upgrade
docker-compose exec app php -d memory_limit=-1 bin/magento setup:static-content:deploy -f
docker-compose exec redis redis-cli  FLUSHALL
