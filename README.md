# Docker Compose: Drupal

Drupal development environment using [Docker Compose](https://docs.docker.com/compose/).


## Prerequisites

1. [Docker](http://docker.com)
  ```
  docker --version
  ```
2. [Docker Compose](https://docs.docker.com/compose/)
  ```
  docker-compose --version
  ```


## Usage

1. Place Drupal in the `/drupal/` directory so that it lives at `docker-compose-drupal/drupal`.
2. Run `docker-compose up`
3. Visit `http://localhost:8000` in your browser
4. Use `drupal:drupal@mysql/drupal` for the database settings
5. To run a [Drush](http://drush.org) command, execute `docker-compose run web drush status`

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

## Thanks
With thanks to Rob Loach for his [Docker Compose repo](https://github.com/RobLoach/docker-compose-drupal), @wadmiraal for his [Docker Drupal repo](https://github.com/wadmiraal/docker-drupal/) and [Karol Sojko](https://github.com/karolsojko), my fellow colleague from [X-Team](x-team.com) for all their help, directly & indirectly.

Copyright &copy; 2016+ [Paul McCrodden](http://opensourceopenmind.ninja)
