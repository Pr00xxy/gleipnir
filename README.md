# Gleipnir

Pretentiously named project for managing Magento 2 in docker.

## Usage

### Installation
```bash
composer require prooxxy/gleipnir:1.* --dev
chmod +x bin/gleipnir

mkdir -p .gleipnir/config/
touch .gleipnir/config/.env.gleipnir

```

Please see `config/.env.gleipnir` for an example setup of how to configure your project.

### Use

Once installed the package will add a file at `bin/gleipnir`
This file replaces `bin/magento` henceforth.

Run `bin/gleipnir help` to list usable commands

`gleipnir` is used to invoke commands but is also the entrypoint for magento as mentioned.

Any arguments not recognised by gleipnir will be passed to magento.

Therefor arguments such as start, stop, restart will be interpreted by gleipnir whereas setup:upgrade, cache:flush etc will be passed into the php container to Magento.

## Features

* Set dependency versions in config
* Multisite support
* TLS support
* toggleable Varnish
* support for additional docker-compose files
* rabbitmq installed
* mail interception with mailhog
* installable through composer


## TODOs
* add support for mysql 8
* add support for execing into the php container
    - instead of running raw docker-compose
* add shortcuts
    - users should be able to add scripts in ./.gleipnir/scripts
    - scripts are registered in .gleipnir/.scripts.env by a key
    - users can run the scripts in the php container by the key
