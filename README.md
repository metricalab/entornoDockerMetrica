|Entorno con docker para MétricaLab | ![Metrica](images/metricaLogo.jpg) |
|-------|--------|

Mediante este entorno se dispone un servidor **nginx** (con PHP) y una base de datos **Mysql** para realizar los talleres. Por defecto se dispone de una base de datos llamada **db_sayings**.

## Clonar el entorno

Para clonar el entorno se debe lanzar: 

```
git clone https://github.com/metricalab/entornoDockerMetrica.git
```
A continuación se entra en el directorio **entornoDockerMetrica**:

```
cd entornoDockerMetrica
```

## Construir el entorno y borrar los contenedores

Al contruir el entorno se generarán 3 imágenes. Se debe lanzar:

```
docker-compose up -d
```

Para parar los contenedores:

```
docker-compose down
```

## Volúmenes

Los volúmenes en docker son carpetas donde se guardan datos que queremos persistir aunque se para o borre un contenedor. En el directorio raiz se dispone de 3 volúmenes dentro de la carpete volumes:

- **volumes/logs**:  Se guardan los logs que genera el servidor **nginx**
- **volumes/mysql**:  se guardan las base de datos que se crean en **Mysql**  
- **volumes/mysql_init**:  Contiene un script para crear nuevas tablas y usuarios. Actualmente inserta la tabla **db_tasks** y **db_clientes_ex_crud**
- **volumes/mysql_config** : Contiene un fichero con parámetros de configuración	
- **volumes/nginx**: es la carpeta root del servidor. Es decir, si se guarda una página html en ella podrás leerla desde la dirección http://localhost

## Información de la base de datos

- el host de acceso a base de datos es **mysql** no **localhost**
- La password de root es **metrica123**
- Existe un usuario **metricauser** con password **metricapassword** . Este usuario tiene acceso a la base de datos **db_sayings**.

## Test de la correcta instalación de PHP

Antes de comenzar a trabajar con el entorno hay que probar su funcionamiento.
Accesiendo a http://localhost/test/phpinfo.php se comprueba si funciona correctamente el contenedor de php. Si no es así se mostrará una pantalla de error.

![Metrica](https://github.com/metricalab/entornoDockerMetrica/blob/master/volumes/nginx/assets/img/phpinfo.jpg)

## Test de acceso a la base de datos

Antes de comenzar a trabajar con el entorno hay que probar su funcionamiento.
Accediendo a http://localhost/test/connect.php se comprueba si funciona correctamente el contenedor de **Mysql**. Si no es así se mostrará una pantalla de error.

![Metrica](https://github.com/metricalab/entornoDockerMetrica/blob/master/volumes/nginx/assets/img/connect.png)

Si se accede al código de la página **PHP** se puede comprobar que el **HOST** de acceso es **mysql** y no es **localhost**.

## Información de los contenedores generados

Nombres y red usados por los contenedores
La red que se crea se llama **entornodockermetrica_default**. Esta información es necesaria para conectar desde otros contenedores. Para obtener la información de los contenedores generados se lanza el comando: **docker ps -a (los ids varian en cada ejecución)

| CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES |
|--|--|--|--|--|--|--|
| e63d4e64f4e5 | nginx:1.13.8 | "nginx -g 'daemon of…" | 12 hours ago | Up 3 hours | 0.0.0.0:80->80/tcp | entornodockermetrica_nginx_1 |
| e0b9c9bf17cf | mysql:8.0.19 | "docker-entrypoint.s…" | 12 hours ago | Up 3 hours | 0.0.0.0:3306->3306/tcp | entornodockermetrica_mysql_1 |
| abbce5ec8310 | entornodockermetrica_php | "docker-php-entrypoi…" | 12 hours ago | Up 3 hours | 0.0.0.0:9000->9000/tcp | entornodockermetrica_php_1|

## Uso de phpMyAdmin con docker

PhpMyadmin es un cliente web para gestionar bases de datos de manera sencilla. Por comodidad vamos a utilizar una imagen docker del propio creador PhpMyAdmin. Una vez que se ha levantado el entorno de Nginx y Mysql para correr phpMyadmin por el puerto **8081** se debe lanzar el comando:

```
docker run --network=entornodockermetrica_default --name phpmyadmin -d -e PMA_HOST=entornodockermetrica_mysql_1 --link entornodockmetrica_mysql_1:db -p 8081:80 phpmyadmin/phpmyadmin
```

Se puede acceder a la aplicación desde la url: **http://localhost:8081**

## Borrado de todas las imágenes y contenedores

Se debe lanzar el siguiente comando para borrar todo lo creado anteriormente:

```
docker system prune -a --volumes
```

De esta manera todo quedará como si no se hubiera creado ninguna imagen y/o contenedor. Hay que tener en cuenta que las imagenes ocupan mucho espacio en disco. Se pedirá confirmación para realizar la acción.
