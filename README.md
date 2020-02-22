|Entorno con docker para el lab de métrica | ![Metrica](https://github.com/metricalab/refranes/blob/master/src/main/resources/static/metricaLogo.jpg) |
|-------|--------|

Mediante este entorno se dispone un servidor **nginx** (con PHP) y una base de datos **MariaDB** para realizar los talleres. Por defecto se dispone de la una base de datos llamada **db_sayings**.

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
