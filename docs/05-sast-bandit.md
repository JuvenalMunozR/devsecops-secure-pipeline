# Módulo 5 — Integración de Bandit en CI/CD

## Objetivo

Integrar análisis SAST automatizado utilizando Bandit dentro del pipeline DevSecOps basado en GitHub Actions.

Bandit analiza el código Python de la aplicación antes de continuar con las etapas posteriores del pipeline.

## Componentes integrados

- GitHub Actions
- Bandit
- Python
- Docker
- Trivy
- GitHub Actions Artifacts

## Versión utilizada

El pipeline utiliza:

~~~text
Bandit 1.9.4
Python 3.12
~~~

La versión de Bandit se especifica explícitamente en el workflow:

~~~bash
pip install bandit==1.9.4
~~~

Esto permite mantener una versión conocida y reproducible dentro del pipeline.

## Alcance del análisis

Bandit analiza el código ubicado en:

~~~text
app/
~~~

El comando utilizado en el workflow es:

~~~bash
mkdir -p reports
bandit -r app/ -f txt -o reports/bandit-report.txt || true
~~~

El parámetro `-r` permite analizar recursivamente el directorio indicado.

El formato utilizado es texto mediante:

~~~text
-f txt
~~~

El resultado se almacena en:

~~~text
reports/bandit-report.txt
~~~

## Artifact

El reporte generado por Bandit se publica mediante GitHub Actions Artifacts.

El artifact se identifica como:

~~~text
bandit-report
~~~

Esto permite conservar el resultado del análisis asociado a la ejecución del workflow.

## Comportamiento del pipeline

Actualmente Bandit funciona como control SAST informativo.

El comando utiliza:

~~~bash
|| true
~~~

Por este motivo, un hallazgo de Bandit no detiene actualmente el pipeline.

El security gate del pipeline corresponde al análisis de vulnerabilidades de Trivy.

## Validación local

Durante la validación local se ejecutó Bandit sobre la aplicación:

~~~bash
bandit -r app/ -f txt -o /tmp/bandit-report.txt
~~~

La ejecución identificó el hallazgo:

~~~text
B104 — hardcoded_bind_all_interfaces
~~~

El hallazgo corresponde al uso de:

~~~python
app.run(host="0.0.0.0", port=5000)
~~~

Bandit lo identifica porque la aplicación escucha en todas las interfaces de red.

## Interpretación del hallazgo B104

En este proyecto, `0.0.0.0` tiene una función relacionada con la ejecución de la aplicación dentro del contenedor Docker.

El hallazgo fue analizado durante la validación y no se modificó el código de la aplicación únicamente para eliminar la alerta de Bandit.

La decisión permite mantener el comportamiento necesario para la ejecución del contenedor y documentar explícitamente el hallazgo.

## Relación con el pipeline

El flujo de seguridad es:

~~~text
Developer
    |
    v
GitHub Actions
    |
    +--> Bandit SAST
    |       |
    |       +--> bandit-report
    |
    +--> Docker Build
    |
    +--> Trivy Scan
    |       |
    |       +--> trivy-report
    |
    +--> Security Gate
~~~

Bandit proporciona análisis SAST sobre el código fuente, mientras Trivy analiza la imagen Docker y aplica actualmente la política de enforcement.

## Resultado

La integración permite incorporar análisis SAST al ciclo CI/CD y conservar sus resultados como artifact.

El diseño actual mantiene una separación entre:

- Análisis SAST mediante Bandit
- Análisis de vulnerabilidades mediante Trivy
- Enforcement de seguridad mediante el security gate de Trivy
