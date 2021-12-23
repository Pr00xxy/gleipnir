# Gleipnir

Magento 2 environment manager for local setup

NOTE: This is my personal project. I try but will not promise that I'll follow semver nor that it receives updates. This project should therefor serve as an example of how one could manage local environments when dealing with multiple projects.

### Installation

```bash
composer require prooxxy/gleipnir:1.* --dev
chmod +x bin/gleipnir

mkdir -p .gleipnir/config/
touch .gleipnir/config/.env.gleipnir
```

### Use

Once installed the executable is available at `bin/gleipnir`
This file replaces `bin/magento` and `docker-compose` henceforth.

Run `bin/gleipnir help` to list usable commands

`gleipnir` is used to invoke commands but is also the entrypoint for magento as mentioned.

Any arguments not recognised by gleipnir will be passed to magento.

Therefor arguments such as `start`, `stop`, `restart` will be interpreted by gleipnir whereas `setup:upgrade`, `cache:flush` etc will be passed into the php container to `bin/magento`.

Please see `config/.env.gleipnir` for an example configuration.

#### Configuration

The config lives inside `config/.env.gleipnir`  
It can be overriden through `.gleipnir/config/.env.gleipnir` by simply adding modified key=value pairs

The `PROJECT_NAME` is the unique identifier for projects. This must be unique for every project you start  
`TLD` is top level domain and can be changed to whatever you want  
`SERVICES` contains a list of enabled services. removing services from this list disables them. (docker-composer depends_on constraints still rule)

`MULTISITE` contains a list of site entries.  
A site entry contains 3 parts. <domain_name>:<run_code>:<run_scope>
The following example will result in the creation of a site with the following configuration
domain + `TLD` = dummy.test  
MAGE_RUN_CODE = default  
MAGE_RUN_TYPE = website

```
PROJECT_NAME='gleipnir'
TLD=".test"
SERVICES=('proxy' 'database' 'php' 'rabbitmq' 'redis' 'mailhog' 'elasticsearch')
MULTISITE=("dummy:default:website")
```

#### Override docker-compose.yml

One may override the docker-compose.dist.yml if needed. Follow the steps below to do so
1. In `.gleipnir/config/` add new file called `docker-compose.dist.yml`
2. Add overrides as one normal when adding additional files to docker-compose

#### Varnish

Varnish can be toggled with the USE_VARNISH flag.  

The proxy service is responsible for TLS termination and passing data to varnish.  
When varnish is not used it will instead pass data directly to the httpd service that normally receives its data from varnish.

#### Override configuration files

TODO

## Features

* Set dependency versions in config
* Multisite support
* TLS support
* toggleable Varnish
* support for additional docker-compose files
* rabbitmq installed
* mail interception with mailhog

## TODOs
* Add support for mysql 8
* Add support for composer versions