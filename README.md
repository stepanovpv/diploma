Ansible playbook осуществляет установку связки MySQL + WordPress + FPM + Аpache.

Запуск плейбука должен осуществлятся на подготовленную инфраструктуру с настроенными SSH ключами. По умолчанию установка происходит из под пользователя deploy. Более никаких настрое не требуется.

Запуск плейбука осуществляется запуском скрипта start.sh, а котором прописаны параметры запуска.

Установка, по умолчанию, происходит на хостах:
- сервер приложения 1
- сервер приложения 2
- сервер БД

Хосты назначаются в inventory/hosts.ini

В репозиторий так же добавлена оснестка для запуска плебука посредством CI/CD.

Описание проекта полностью доступно по ссылке: https://gitlab.com/newbie_devops/ansible-wordpress/-/wikis/Описание-проекта 


