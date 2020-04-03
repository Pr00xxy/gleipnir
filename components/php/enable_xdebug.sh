#!/usr/bin/env bash

echo -n "Turning xdebug on ... "
sed -i '/xdebug.default_enable=0/c\xdebug.default_enable=1' $COMPONENTS_PATH/php/${PHP_VERSION}/conf/php.ini
sed -i '/xdebug.remote_autostart=0/c\xdebug.remote_autostart=1' $COMPONENTS_PATH/php/${PHP_VERSION}/conf/php.ini
echo "done"