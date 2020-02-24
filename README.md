|Entorno con docker para el lab de métrica | ![Metrica](https://github.com/metricalab/refranes/blob/master/src/main/resources/static/metricaLogo.jpg) |
|-------|--------|

Mediante este entorno se dispone un servidor **nginx** (con PHP) y una base de datos **MariaDB** para realizar los talleres. Por defecto se dispone de una base de datos llamada **db_sayings**.

## Clonar el entorno

Para clonar el entorno se debe lanzar: 

```
git clone https://github.com/metricalab/entornoDockerMetrica
```

## Construir el entorno y borrar los contenedores

Al contruir el entorno se generarán 3 imágenes. Se debe lanzar:

```
docker-compose up -d
```

Para borrar los contenedores:

```
docker-compose down
```

## Volúmenes

Los volúmenes en docker son carpetas donde se guardan datos que queremos persistir aunque se para o borre un contenedor. En el directorio raiz se dispone de 3 volúmenes dentro de la carpete volumes:

- **volumes/logs**:  Se guardan los logs que genera el servidor **nginx**
- **volumes/mariadb**:  se guardan las base de datos que se crean en la base de datos **MariaDB**  
- **volumes/nginx**: es la carpeta root del servidor. Es decir, si guardas una página html en ella podrás leerla desde la dirección http://localhost

## Información de la base de datos

- La password de root es **metrica123**
- Existe un usuario **metricauser** con password **metricapassword** . Este usuario tiene acceso a la base de datos **db_sayings**.

## Uso de phpMyAdmin con docker

PhpMyadmin es un cliente web para gestionar bases de datos de manera sencilla. Por comodidad vamos a utilizar una imagen docker del propio creador PhpMyAdmin. Una vez que se ha levantado el entorno de Nginx y MariaDB para correr phpMyadmin por el puerto **8081** se debe lanzar el comando:

```
docker run --network=entornodockermetrica_default --name phpmyadmin -d -e PMA_HOST=entornodockermetrica_mysql_1 --link entornodockmetrica_mysql_1:db -p 8081:80 phpmyadmin/phpmyadmin
```

Se puede acceder a la aplicación desde la url: **http://localhost:8081**
