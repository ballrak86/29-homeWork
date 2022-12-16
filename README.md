#29-homeWork. 45 - Проект  
## Описание файлов в директории
logFileFull.log - полный лог выполнения  

Vagrant_folder - все что понадобится для поднятия ВМ и краткое описание файлов в ней  
Vagrantfile - вагрант файл  
provisioning - директория с файлами провижинга  
```
├── bet.dmp
├── conf
│   └── conf.d
│       ├── 01-base.cnf
│       ├── 02-max-connections.cnf
│       ├── 03-performance.cnf
│       ├── 04-slow-query.cnf
│       └── 05-binlog.cnf
├── defaults
│   └── main.yml
├── master.sql
├── playbook.yml
└── Vagrantfile
```

## Описание как запустить виртуальную машину (кратко)
```
vagrant up
```

## Проверка работы


📚Домашнее задание/проектная работа разработано(-на) для курса ["Administrator Linux. Professional"](https://otus.ru/lessons/linux-professional/)