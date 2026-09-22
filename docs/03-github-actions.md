# Módulo 3 — GitHub Actions

## Objetivo

Automatizar los controles de seguridad del proyecto mediante GitHub Actions.

El workflow ejecuta análisis SAST, construcción de la imagen Docker, análisis de vulnerabilidades con Trivy y una política de seguridad que puede detener el pipeline.

## ¿Qué es GitHub Actions?

GitHub Actions es la plataforma de automatización integrada en GitHub.

En este proyecto se utiliza para ejecutar automáticamente los controles de seguridad cuando se crea o actualiza un Pull Request hacia `main` y cuando se realiza un `push` a `main`.

## Ubicación del workflow

El workflow se encuentra en:

~~~text
.github/workflows/trivy-scan.yml
~~~

## Eventos de ejecución

El workflow se ejecuta mediante:

~~~yaml
on:
  pull_request:
    branches: [ "main" ]
  push:
    branches: [ "main" ]
~~~

Esto permite validar cambios antes de incorporarlos a `main` y ejecutar nuevamente el pipeline después del merge.

## Flujo del pipeline

Las etapas principales son:

1. Checkout del repositorio.
2. Configuración de Python 3.12.
3. Instalación de Bandit 1.9.4.
4. Análisis SAST sobre `app/`.
5. Publicación del reporte de Bandit.
6. Construcción de la imagen Docker.
7. Instalación de Trivy 0.74.0.
8. Análisis de vulnerabilidades de la imagen.
9. Publicación del reporte de Trivy.
10. Aplicación del security gate.

## Bandit

Bandit se instala con:

~~~bash
pip install bandit==1.9.4
~~~

El análisis se ejecuta sobre `app/` y genera un reporte:

~~~bash
mkdir -p reports
bandit -r app/ -f txt -o reports/bandit-report.txt || true
~~~

El reporte se publica como artifact.

En V2, Bandit genera evidencia de SAST, pero no constituye el security gate.

## Docker Build

La imagen se construye mediante:

~~~bash
docker build -t devsecops-app .
~~~

La construcción utiliza el `Dockerfile` y `requirements.txt` del repositorio.

En el workflow de CI, la imagen se construye utilizando el tag `devsecops-app`.

La validación local puede utilizar el tag versionado `devsecops-app:v2`.

## Trivy

El workflow utiliza Trivy 0.74.0 y limita el análisis al scanner de vulnerabilidades:

~~~bash
--scanners vuln
~~~

El análisis genera un reporte JSON:

~~~bash
trivy image   --scanners vuln   --format json   -o reports/trivy-report.json   devsecops-app
~~~

El reporte se publica como artifact.

## Security Gate

La política de seguridad se aplica mediante:

~~~bash
trivy image   --scanners vuln   --severity HIGH,CRITICAL   --ignore-unfixed   --exit-code 1   devsecops-app
~~~

El gate considera vulnerabilidades HIGH y CRITICAL y excluye aquellas que no tienen una corrección disponible.

El parámetro `--exit-code 1` hace que el paso falle cuando existen vulnerabilidades que cumplen los criterios definidos.

## Artifacts

El workflow conserva dos reportes como artifacts:

~~~text
bandit-report
trivy-report
~~~

## Resultado

Un pipeline exitoso completa todas las etapas y supera el security gate.

El pipeline puede fallar cuando Trivy encuentra vulnerabilidades HIGH o CRITICAL con corrección disponible.

## Relación con DevSecOps

El workflow integra los controles de seguridad dentro del proceso de integración continua:

~~~text
Developer
    |
    v
Pull Request / Push
    |
    v
GitHub Actions
    |
    +--> Bandit SAST
    |
    +--> Docker Build
    |
    +--> Trivy Vulnerability Scan
    |
    +--> Security Reports
    |
    +--> Security Gate
~~~

De esta forma, los controles de seguridad se ejecutan automáticamente como parte del ciclo de desarrollo.
