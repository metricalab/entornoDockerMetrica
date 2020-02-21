# entornoDockerMetrica
Entorno de desarrollo docker para disponer de ciertas herramientas:

- Base de datos MariaDB (con la base de datos db_sayings creada). Puerto 3306.
- Nginx corriendo en el puerto 80 con PHP


## Clonar el entorno

Para clonar el entorno se debe lanzar: 

```
git clone https://github.com/metricalab/entornoDockerMetrica
```

## Construir el entorno

Al contruir el entorno se generarán 3 imágenes. Se debe lanzar:

```
docker-compose up -d
```

Para borrar los contenedores:

```
docker-compose down
```

## Volúmenes
