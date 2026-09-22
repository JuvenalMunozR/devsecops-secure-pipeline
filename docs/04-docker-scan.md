# Módulo 4 — Docker + Trivy Scan

## Objetivo

Construir la imagen Docker de la aplicación y analizarla con Trivy para identificar vulnerabilidades conocidas.

Este módulo conecta la construcción del contenedor con los controles de seguridad utilizados posteriormente en GitHub Actions.

## Dockerfile

La aplicación se empaqueta mediante el `Dockerfile` ubicado en la raíz del repositorio.

La imagen utiliza:

~~~dockerfile
FROM python:3.12-slim
~~~

La aplicación se ejecuta dentro del contenedor utilizando un usuario no root:

~~~dockerfile
USER appuser
~~~

El contenedor expone el puerto:

~~~dockerfile
EXPOSE 5000
~~~

## Dependencias

Las dependencias de Python se mantienen en:

~~~text
requirements.txt
~~~

Actualmente la aplicación utiliza Flask `3.1.3`.

Las dependencias se instalan durante la construcción de la imagen.

## Construcción de la imagen

La imagen puede construirse localmente mediante:

~~~bash
docker build --no-cache -t devsecops-app:v2 .
~~~

El parámetro `--no-cache` permite realizar una construcción completa sin reutilizar capas anteriores.

## Ejecución del contenedor

La imagen validada localmente se ejecuta mediante:

~~~bash
docker run --rm -d   --name devsecops-app-v2   -p 5000:5000   devsecops-app:v2
~~~

La aplicación Flask escucha en el puerto `5000`.

La publicación:

~~~text
5000:5000
~~~

relaciona el puerto `5000` del host con el puerto `5000` del contenedor.

## Validación de la aplicación

La aplicación se validó mediante:

~~~bash
curl http://localhost:5000
~~~

La respuesta esperada es:

~~~text
DevSecOps App Running 🚀
~~~

## Análisis con Trivy

Una vez construida la imagen, Trivy puede analizarla manualmente:

~~~bash
trivy image   --scanners vuln   --severity HIGH,CRITICAL   devsecops-app:v2
~~~

Este análisis permite identificar vulnerabilidades HIGH y CRITICAL presentes en la imagen.

## Security Gate

La política utilizada por el pipeline es:

~~~bash
trivy image   --scanners vuln   --severity HIGH,CRITICAL   --ignore-unfixed   --exit-code 1   devsecops-app:v2
~~~

El parámetro `--ignore-unfixed` excluye del gate las vulnerabilidades para las cuales no existe una corrección disponible.

El parámetro `--exit-code 1` permite utilizar Trivy como mecanismo de enforcement dentro del pipeline.

## Resultado de la validación

Durante la validación local de `devsecops-app:v2`, Trivy identificó vulnerabilidades HIGH en componentes de la imagen base.

Al aplicar `--ignore-unfixed`, el security gate local finalizó correctamente.

La misma política fue posteriormente integrada en GitHub Actions.

## Relación con el pipeline

El flujo completo es:

~~~text
Dockerfile
    |
    v
Docker Build
    |
    v
devsecops-app:v2
    |
    v
Trivy Vulnerability Scan
    |
    v
Security Gate
~~~

La validación local permite comprobar el comportamiento de la imagen y de los controles de seguridad antes de su ejecución automatizada en CI/CD.
