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

- volumes/logs :  Se guardan los logs que genera el servidor **nginx**
- volumes/mariadb:  se guardan las base de datos que se crean en la base de datos **MARIADB**  
- volumes/nginx: es la carpeta root del servidor. Es decir, si guardas una página html en ella podrás leerla desde la dirección http://localhost
