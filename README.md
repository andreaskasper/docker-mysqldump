# docker-mariadb-galera
MySQL dump inspired by the work of @camilb .

### Features
- [x] dump and import a single or multiple databases
- [x] dump each database into a different file
- [x] exclude a database from dump

### Build status:
[![Build Status](https://img.shields.io/docker/cloud/automated/andreaskasper/mysqldump.svg)](https://hub.docker.com/r/andreaskasper/docker-mysqldump)
[![Build Status](https://img.shields.io/docker/cloud/build/andreaskasper/mysqldump.svg)](https://hub.docker.com/r/andreaskasper/docker-mysqldump)

### Bugs & Issues:
![Github Issues](https://img.shields.io/github/issues/andreaskasper/docker-mysqldump.svg)
![Code Languages](https://img.shields.io/github/languages/top/andreaskasper/docker-mysqldump.svg)

### Running the container :

#### Dump a database to the current directory

```sh
$ docker run --rm \
  -v $PWD:/mysqldump \
  -e DB_NAME=db_name \
  -e DB_PASS=db_pass \
  -e DB_USER=db_user \
  -e DB_HOST=db_host \
  andreaskasper/mysqldump
```

#### Dump all databases to the current directory

```sh
$ docker run --rm \
  -v $PWD:/mysqldump \
  -e DB_PASS=db_pass \
  -e DB_USER=db_user \
  -e DB_HOST=db_host \
  -e ALL_DATABASES=true \
  andreaskasper/mysqldump
```

#### Exclude one database from dump

```sh
$ docker run --rm \
  -v $PWD:/mysqldump \
  -e DB_PASS=db_pass \
  -e DB_USER=db_user \
  -e DB_HOST=db_host \
  -e ALL_DATABASES=true \
  -e IGNORE_DATABASE=some_database \
  andreaskasper/mysqldump
```

#### Import one database from the current directory

```sh
$ docker run --rm \
  -v $PWD:/mysqldump \
  --entrypoint /import.sh \
  -e DB_NAME=db_name \
  -e DB_HOST=db_host \
  -e DB_USER=db_user \
  -e DB_PASS=db_pass \
  andreaskasper/mysqldump
```

#### Import all the databases from the current directory

```sh
$ docker run --rm \
  -v $PWD:/mysqldump \
  --entrypoint /import.sh \
  -e DB_NAME=db_name \
  -e DB_HOST=db_host \
  -e DB_USER=db_user \
  -e DB_PASS=db_pass \
  -e ALL_DATABASES=true \
  andreaskasper/mysqldump
```

### Environment Parameters
| Parameter     | Description   |
| ------------- |:-------------:|
| ALL_DATABASES | dump all databases if set to true |
| IGNORE_DATABASE | exclude database from dump |
| DB_HOST | hostname of MySQL or MariaDB server |
| DB_NAME | Database name |
| DB_PASS | DB-Password |
| DB_USER | DB-Username |


### Folders:
| Folder        | Description   |
| ------------- |:-------------:|
| /mysqldump    | the folder, where you will find your dumps  |

### Steps
- [x] Build a base test image to test this build process (Travis/Docker)
- [ ] Build tests
- [ ] Gnomes
- [ ] Profit

### support the projects :hammer_and_wrench:
* [![donate via Patreon](https://img.shields.io/badge/Donate-Patreon-green.svg)](https://www.patreon.com/AndreasKasper)
* [![donate via PayPal](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/AndreasKasper)
