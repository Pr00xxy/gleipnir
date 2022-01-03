# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2021-12-23
### Changed
- Replaced run command in favour of new general purpose shell command
- Remove leftover mongodb config
- Proxy service now acts as httpd service when varnish is disabled

### Fixed
- Fix bug where additional compose files didnt work
- Adjusted realpath caching ttl for php 8 to 5000 seconds
- Adjusted memory limit for php 7.1 to 1G
## [1.2.0] - 2021-11-17
### Fixed
- Fixed typo in profiler restart script
### Added
- Added support for phpunit execution

## [1.1.2] - 2021-09-13
### Fixed
- Fixed static file assets not being present in httpd container

## [1.1.1] - 2021-08-25
### Fixed
- Fixed tagging latest release

## [1.1.0] - 2021-07-07
### Added
- Added support for xdebug trace
### Fixed
- Aligned Magento 2 nginx config with latest release

## [1.0.2] - 2021-05-27
### Fixed
- Fixed missing required multistore variables

## [1.0.1] - 2021-03-07
### Fixed
- rename "remove" command to "uninstall"

## [1.0.0] - 2021-03-03
> First major release
### Changed
- Improved help command
- Moved all generated files to dedicated var directory

## [0.15.0] - 2021-03-03
### Changed
- Default redis version is now 6.0
- Default php version is now 7.4
- Default varnish version is now 6.0
### Fixed
- Fixed php 7.4 Dockerfile that was never working

## [0.14.0] - 2021-02-15
### Added
- Added php profiler support
- Added php 8.0 support
### Fixed
- Fixed bug caused by xdebug 3 release

## [0.12.2] - 2020-11-24
### Fixed
- Fixed command calling unknown shell in redis container

## [0.12.1] - 2020-11-03
### Fixed
- Fixed variable expansion bug 

## [0.12.0] - 2020-11-01
### Changed
- httpd service now only mounts pub folder
- Removed mongodb service
- Increase varnish health check interval
### Added
- Add support for docker-compose.yml override
- redis version is now changeable


## [0.11.0] - 2020-09-06
### Changed
- Removed unused dns feature 
- Bump mysql max_connections
- Moved config files to dedicated folder
- Migrated php 7.2 to alpine
- Improved code quality and help messages
### Added
- Added support for disabling optional services
- Added config override capability
- Added php 7.4 support
- Added persistancy to mongodb service
- Added command for mysqldump from database container to file
### Fixed
- Fixed typo in php extra hosts
- Removed accidental commit files
- Fixed typo in composer json license
- Fixed bug where vhost cleanup didnt work
- Fixed bug where network didnt get removed on shutdown


## [0.10.0] - 2020-06-29
### Added
- Added Varnish Cache support
### Changed
- migrated php 7.3 to alpine image
- Improved general code quality

## [0.8.3] - 2020-06-09
### Removed
- removed unused /etc/hosts adder feature

## [0.8.2] - 2020-06-09
### Fixed
- Fixed bug where commands were not passed into php container correctly
- Added missing mcrypt to php 7.1

## [0.8.1] - 2020-06-03
> A patch that is a feature release
### Added
- Added compiler for docker-compose file
- Added mongodb service
### Changed
- Tuned mysql settings

## [0.8.0] - 2020-04-04
> Gleipnir is born
### Changed
- bin/console renamed to bin/gleipnir
- Introduced internal variables for pathing and refactored files accordingly
- Refactored startup and shutdown script flows
### Added
- mailhog ports are now controlled through a variable
- Xdebug toggler added
- Custom network added
### Fixed
- pathing in docker-compose.yml fixed to project root
- xdebug is now disabled by default

## [0.7.0] - 2020-03-27
### Added
- Elasticsearch is now supported
- mysql configuration file added
### Changed
- .env is now split into separate smaller files

## [0.6.0] - 2020-03-23
> Persistancy between restarts
### Added
- rabbitmq and redis data now persists through restart

## [0.5.0] - 2020-03-20
> Xdebug build
### Added
- Added Xdebug support
- Package is now installable through composer

## [0.4.1] - 2020-03-19
> Lazy mistake build
### Fixed
- Fixed typo in dotenv file

## [0.4.0] - 2020-03-19
> Refactor build
### Fixed
- Refactor nginx configuration files
- Add missing dependencies to php Dockerfiles

## [0.3.0] - 2020-03-19
> Cleanup build
### Removed
- Sloppy debugging code removed
- Removed dynamic file
### Fixed
- Refactored various internal filenames
- refactor hardcoded database port number

## [0.1.0] - 2020-03-15
> Beta release, working but features are limited
### Added
- Basic start stop restart commands
- Basic passthrough to bin/magento
- Added services php, redis, nginx, rabbitmq



