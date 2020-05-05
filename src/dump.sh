#!/bin/bash

DB_USER=${DB_USER:-${MYSQL_ENV_DB_USER}}
DB_PASS=${DB_PASS:-${MYSQL_ENV_DB_PASS}}
DB_NAME=${DB_NAME:-${MYSQL_ENV_DB_NAME}}
DB_HOST=${DB_HOST:-${MYSQL_ENV_DB_HOST}}
ALL_DATABASES=${ALL_DATABASES}
IGNORE_DATABASE=${IGNORE_DATABASE}


if [[ ${DB_USER} == "" ]]; then
	echo "[\e[91mERROR\e[0m] Missing DB_USER env variable"
	exit 1
fi
if [[ ${DB_PASS} == "" ]]; then
	echo "[\e[91mERROR\e[0m] Missing DB_PASS env variable"
	exit 1
fi
if [[ ${DB_HOST} == "" ]]; then
	echo "[\e[91mERROR\e[0m] Missing DB_HOST env variable"
	exit 1
fi

if [[ ${ALL_DATABASES} == "" ]]; then
	if [[ ${DB_NAME} == "" ]]; then
		echo "[\e[91mERROR\e[0m] Missing DB_NAME env variable"
		exit 1
	fi
	mysqldump --user="${DB_USER}" --password="${DB_PASS}" --host="${DB_HOST}" "$@" "${DB_NAME}" > /mysqldump/"${DB_NAME}".sql
else
	databases=`mysql --user="${DB_USER}" --password="${DB_PASS}" --host="${DB_HOST}" -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] && [[ "$db" != "$IGNORE_DATABASE" ]]; then
        echo -ne "[*] Dumping database: $db "
        mysqldump --user="${DB_USER}" --password="${DB_PASS}" --host="${DB_HOST}" --databases $db > /mysqldump/$db.sql
	echo -e "\e[92mdone\e[0m"
    fi
done
fi
