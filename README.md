## Системные требования

`ansible version`: 2.9

`os-release`: "CentOS Linux 7", "Ubuntu 18.04.3 LTS"

## Процесс развертывания wordpress

### inventory

Заполнить файл inventory

```
[SERVER_NAME] ansible_connection=ssh ansible_host=[SERVER_IP]  ansible_port=[SERVER_SSH_PORT] ansible_user=[SERVER_USER]
```

`SERVER_NAME` - имя сервера

`SERVER_IP` - ip адрес сервера

`SERVER_SSH_PORT` - ssh порт

`SERVER_USER` - пользователь под котороым будет происходить развертывание. ***Пользователь должен иметь возможность поышения прав до root без запроса пароля.***

### Запуск ansible-playbook

```
ansible-playbook -i inventory main.yaml -vv

```

### После успешного выполнения тасок плейбука. 

Зайти по ip на любой из фронтов: `http://[FRONT1_ip]` или `http://[FRONT2_IP]`

## Глобальные переменные

### wordpress-global-vars

`wordpress_volume` - названия docker volume в которм храняться файлы wordpress

`wordpress_php_fpm_host` - ip адрес хоста на которм запущен php-fpm

`mysql_host` -ip адрес сервера mysql

`mysql_databases` - название базы данных для wordpress

`mysql_user` - пользователь базы данных wordpress

`mysql_password` - пароль пользователя базы данных wordpress

## Роли

### - common

Базовая подготовка OS

Содержит следующий набор тегов для исполнения:

 1. `selinux-configuration`: Распостранение конфигурации SELinux.
 2. `sudoers-configuration`: Упрвление привилегиями пользователей.
 3. `timezone-configuration`: Настройка timezone. Timezone задается переменной `time_zone="Europe/Moscow"`.
 4. `basic-package-install`: Установка базового набора пакетов.
 5. `yum-upgrade`: Обновление операционной системы CentOS. Выполняется с ключем `all_upgrade=True`
 6. `apt-upgrade`: Обновление операционной системы Ubuntu. Выполняется с ключем `all_upgrade=True`
 7. `service-default-configuration`: Базовое конфигурирование набра сервисов.

### - docker

Установка и настройка docker.

Тег для исполнения: `docker-configuration`

### - mysql

Развертывание и настройка сервера MySQL.

#### Описание переменных

`mysql_root_password` - пароль пользователя root базы данных mysql.

`mysql_server_image` - docker image сервера mysql.

`mysql_server_tag` - версия docker image.

`mysql_server_restart` - принудительный перезапуск контейнера.

`mysql_server_network_mode` - режим использования сети.

`mysql_server_container_name` - имя контейнера mysql

`mysql_server_bind_mounts` - список подключаемых каталогов.

`mysql_server_ulimits` - список вариантов ulimits.

`mysql_server_log_driver` - указание драйвера логов.

`mysql_server_log_options` - список специфичных опций для выбранного log_driver.

Тег для исполнения: `mysql-configuration`

### - nginx

Развертывение и настройка сервера Nginx.

#### Описание переменных

`nginx_server_image` - docker image сервера nginx.

`nginx_server_tag` - версия docker image.

`nginx_server_restart` - принудительный перезапуск контейнера.

`nginx_server_network_mode` - режим использования сети.

`nginx_server_container_name` - имя контейнера nginx

`nginx_server_bind_mounts` - список подключаемых каталогов.

`nginx_server_ulimits` - список вариантов ulimits.

`nginx_server_log_driver` - указание драйвера логов.

`nginx_server_log_options` - список специфичных опций для выбранного log_driver.

Тег для исполнения: `nginx-configuration`

### - wordpress

Развертывание сервера wordpress + php-fpm

#### Описание переменных

`WORDPRESS_DB_HOST` - ip:port для подключения к mysql.

`WORDPRESS_DB_USER` - имя пользователя базы данных wordpress.

`WORDPRESS_DB_PASSWORD` - пароль пользователя базы данных wordpress.

`WORDPRESS_DB_NAME` - название базы данных wordpress.

`wordpress_server_image` - docker image сервера wordpress.

`wordpress_server_tag` - версия docker image.

`wordpress_server_restart` - принудительный перезапуск контейнера.

`wordpress_server_network_mode` - режим использования сети.

`wordpress_server_container_name` - имя контейнера nginx

`wordpress_server_bind_mounts` - список подключаемых каталогов.

`wordpress_server_ulimits` - список вариантов ulimits.

`wordpress_server_log_driver` - указание драйвера логов.

`wordpress_server_log_options` - список специфичных опций для выбранного log_driver.

Тег для исполнения: `wordpress-configuration`
