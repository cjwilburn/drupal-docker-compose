# Docker Compose: Drupal

Drupal development environment using [Docker Compose](https://docs.docker.com/compose/); php-fpm, nginx, mysql, solr.


## Prerequisites

1. [Docker](http://docker.com)
  ```
  docker --version
  ```
2. [Docker Compose](https://docs.docker.com/compose/)
  ```
  docker-compose --version
  ```
3. [Docker Machine NFS](https://github.com/adlogix/docker-machine-nfs)
 * Mac Users using this script to use NFS should be able to use default setup.
 * If not using NFS or on other OS, see [Dockerfile](https://github.com/mccrodp/drupal-docker-compose/blob/master/Dockerfile) for directory ownership mapping.

## Usage

1. Place Drupal in the `/drupal/` directory so that it lives at `docker-compose-drupal/drupal`.
2. Run `docker-compose up`
3. Visit `http://VBOXNET_IP:8000` in your browser
4. Use `drupal:drupal@mysql/drupal` for the database settings. e.g. `docker exec -i drupaldockercompose_mysql_1 mysql -udrupal -pdrupal drupal < database_dump.sql`
5. To run a [Drush](http://drush.org) command, execute `docker-compose exec web drush status`

## License

Licensed under the [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/).

## Thanks
With thanks to Rob Loach for his [Docker Compose repo](https://github.com/RobLoach/docker-compose-drupal), @wadmiraal for his [Docker Drupal repo](https://github.com/wadmiraal/docker-drupal/) and [Karol Sojko](https://github.com/karolsojko), my fellow colleague from [X-Team](x-team.com) for all their help, directly & indirectly.

Copyright &copy; 2016+ [Paul McCrodden](http://opensourceopenmind.ninja)
