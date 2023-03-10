# Ansible playbook осуществляет установку связки MySQL + WordPress + FPM + Аpache.

| Role Name         	|
|-------------------	|
| Apache             	|
| MySQL             	|
| PHP               	|
| WordPress         	|

## Supported OS
* Ubuntu 20.04

# Installation
## Manual Ansible Installation
Запуск плейбука должен осуществлятся на подготовленную инфраструктуру с настроенными SSH ключами. По умолчанию установка происходит из под пользователя deploy. Более никаких настроек не требуется.

Запуск плейбука осуществляется запуском скрипта start.sh, в котором прописаны параметры запуска.

Установка, по умолчанию, происходит на хостах:
- сервер приложения 1
- сервер приложения 2
- сервер БД

Хосты назначаются в inventory/hosts.ini

## CI/CD Ansible Installation
В репозиторий так же добавлена оснастка для запуска плебука посредством CI/CD.

Для автоматического запуска по средством CI/CD необходимо добавить SSH ключ от терминальной ВМ с которой будет вся раскатка, также необходимо в .gitlab-ci.yml указать адрес данной ВМ.

**Описание проекта полностью доступно по ссылке: https://gitlab.com/newbie_devops/ansible-wordpress/-/wikis/Описание-проекта **


