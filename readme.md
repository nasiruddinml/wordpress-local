# Build WordPress using Docker Compose

Running WordPress typically involves installing a LAMP (Linux, Apache, MySQL, and PHP) or LEMP (Linux, Nginx, MySQL, and PHP) stack, which can be time-consuming. However, by using tools like Docker and Docker Compose, you can simplify the process of setting up your preferred stack and installing WordPress. Here is the example how to use Docker Compose to quickly build a WordPress site, and how to use Nginx as a reverse proxy server to provide access.

## Prerequisites

Make sure Docker and Docker Compose are installed on your system. If it is not installed yet, you can follow the link below to install it:

- [Docker installation guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

## Instructions

### Clone this repository to your local computer

```sh
git clone https://github.com/nasiruddinml/wordpress-local.git
```

### Copy `.env.example` file and update accordingly

```sh
cp .env.example .env
```

### Update all content inside of wordpress folder

Create the containers with docker-compose up and the -d flag, which will run the mysql, redis, wordpress, and nginx containers in the background:

```sh
docker-compose up -d
```

### You will see output confirming that your services have been created

```sh
 ✔ Container nginx      Running                                                                                                 
 ✔ Container redis      Running                                                                                                 
 ✔ Container mysql      Running                                                                                                 
 ✔ Container wordpress  Running
```

### Using docker-compose ps, check the status of your services

```sh
docker-compose ps
```

If everything was successful, your mysql, redis, wordpress, and nginx services will be Up.

```sh
NAME        IMAGE                  COMMAND                  SERVICE     CREATED       STATUS              PORTS
mysql       mysql:8.0              "docker-entrypoint.s…"   database    2 hours ago   Up About a minute   3306/tcp, 33060/tcp
nginx       nginx:latest           "/docker-entrypoint.…"   nginx       2 hours ago   Up About a minute   0.0.0.0:80->80/tcp
redis       redis:latest           "docker-entrypoint.s…"   redis       2 hours ago   Up About a minute   0.0.0.0:6379->6379/tcp
wordpress   wordpress:php8.2-fpm   "docker-entrypoint.s…"   wordpress   2 hours ago   Up About a minute   9000/tcp
```

If you change on any config re-run nginx

```sh
docker-compose up -d --force-recreate --no-deps nginx
```

Happy dockerize.
