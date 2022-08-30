# salt-docker
Salt master and minions in Docker

## Build and run
1. Check the version you want to install / test on [the release page](https://github.com/saltstack/salt/releases).
1. Change the version in the `docker-compose` file
```shell
sed -i 's/SALT_VERSION: [[:digit:]]\+/SALT_VERSION: <YOUR_VERSION>/g' docker-compose.yml
```
1. Run the docker-compose file
```shell
# If using docker compose plugin
docker compose up [-d]
# else
docker-compose up [-d]
```
1. Check the logs
1. Accept the minions requests on the master
```shell
docker exec saltmaster salt-key -A -y
```
1. Verify the install
```shell
docker exec saltmaster salt '*' test.version
```