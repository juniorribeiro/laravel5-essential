#!/bin/bash

if [ ! -z "$APP_DIR" ]; then
	DOCUMENT_ROOT="/var/www"
	rm -rf ${DOCUMENT_ROOT}

	if [ -d "${APP_DIR}/public" ]; then
		dir="${DOCUMENT_ROOT}"
	else
		dir="${DOCUMENT_ROOT}/public"
	fi

	mkdir -p `dirname ${dir}`
	ln -s $APP_DIR $dir
fi

# Tweak nginx to match the workers to cpu's
procs=$(cat /proc/cpuinfo |grep processor | wc -l)
sed -i -e "s/worker_processes 5/worker_processes $procs/" /etc/nginx/nginx.conf

php-fpm7.0 --allow-to-run-as-root --nodaemonize --fpm-config /etc/php/7.0/fpm/php-fpm.conf &
exec nginx

