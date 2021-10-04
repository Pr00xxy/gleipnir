#!/usr/bin/env bash

echo -n "Turning profiler on ... "
sed -i '/xdebug.profiler_enable=0/c\xdebug.profiler_enable=1' $COMPONENTS_PATH/php/${PHP_VERSION}/conf/php.ini
sed -i '/xdebug.remote_autostart=0/c\xdebug.remote_autostart=1' $COMPONENTS_PATH/php/${PHP_VERSION}/conf/php.ini
echo "done"