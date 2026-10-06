# Bootcamp DevSecOps V2
## Study Guide, Technical Reference and Engineering Review

**Author:** Juvenal Muñoz Rubilar  
**Portfolio:** Engineering / DevSecOps Learning Portfolio

---

# 1. PROPÓSITO Y METODOLOGÍA

## 1.1 Propósito

Esta guía consolida el trabajo realizado en dos repositorios prácticos:

- `devsecops-linux-lab`
- `devsecops-secure-pipeline`

El objetivo no es repetir documentación de laboratorio, sino conectar lo construido, explicar por qué se construyó de esa forma y convertir la experiencia práctica en conocimiento defendible técnicamente.

La guía debe servir para:

- estudiar;
- repasar comandos y conceptos;
- comprender decisiones técnicas;
- interpretar resultados;
- preparar entrevistas técnicas;
- relacionar Linux, Docker, Git, seguridad y CI/CD;
- documentar problemas reales y su resolución.

## 1.2 Niveles de aprendizaje

El aprendizaje se trabaja en tres niveles:

### Nivel operacional

Saber ejecutar una tarea.

### Nivel técnico

Comprender qué hace la herramienta, el comando o la configuración y por qué funciona.

### Nivel de ingeniería

Ser capaz de explicar por qué se eligió una solución, cuáles son sus límites y qué alternativas existen.

## 1.3 Metodología de trabajo

Cada tema se estudia utilizando exactamente esta secuencia:

1. **Problema**
2. **Solución**
3. **Código real del repositorio**
4. **Sintaxis**
5. **Explicación técnica**
6. **Ejecución**
7. **Interpretación de resultados**
8. **Preguntas de entrevista**
9. **Resumen técnico**

La documentación de esta guía debe permanecer alineada con lo que realmente fue ejecutado en los repositorios.

---

# 2. MAPA GENERAL DEL ENGINEERING PORTFOLIO

Los dos repositorios representan etapas diferentes de una misma evolución técnica.

```text
Linux / WSL
     ↓
Filesystem
     ↓
Users & Permissions
     ↓
Processes
     ↓
Networking
     ↓
Monitoring
     ↓
Package Management
     ↓
Linux Hardening
     ↓
Bash
     ↓
Docker
     ↓
Docker Networking
     ↓
Docker Compose
     ↓
Python / Flask
     ↓
Dockerized Application
     ↓
Bandit / SAST
     ↓
Trivy / Vulnerability Scanning
     ↓
GitHub Actions
     ↓
Security Reports
     ↓
Security Gate
     ↓
Docker Hardening
     ↓
DevSecOps
```

## 2.1 Repositorio 01

`devsecops-linux-lab`

Su función es entregar la base operacional:

- Linux;
- filesystem;
- usuarios y permisos;
- procesos;
- networking;
- monitoreo;
- paquetes;
- hardening;
- Bash;
- Docker;
- Docker networking;
- Docker Compose;
- Git y GitHub.

## 2.2 Repositorio 02

`devsecops-secure-pipeline`

Su función es llevar esa base hacia una aplicación y un pipeline de seguridad:

- Python / Flask;
- Docker;
- Bandit;
- Trivy;
- GitHub Actions;
- artifacts;
- security policy;
- security gate;
- Docker hardening.

## 2.3 Integración conceptual

El segundo repositorio no reemplaza al primero.

El segundo utiliza conocimientos que fueron construidos en el primero:

```text
Linux
  ├── procesos
  ├── permisos
  ├── networking
  └── administración
          ↓
Docker
  ├── imagen
  ├── contenedor
  ├── red
  └── ejecución
          ↓
Secure Pipeline
  ├── SAST
  ├── vulnerability scanning
  ├── CI/CD
  └── security policy
```

---

# 3. REPO 01 — LINUX FOUNDATION

Repositorio:

`devsecops-linux-lab`

## 3.1 Filesystem

### Problema

Antes de automatizar o asegurar sistemas Linux es necesario comprender cómo se organiza el filesystem, cómo se navega y cómo se manipulan archivos y directorios.

### Solución

Trabajar directamente con la estructura de Linux y practicar navegación, creación, copia, movimiento, eliminación y búsqueda.

### Código real

Los comandos trabajados en el laboratorio incluyen operaciones como:

```bash
pwd
ls
cd
mkdir
touch
cp
mv
rm
find
tree
```

### Sintaxis

```bash
pwd
```

Muestra el directorio de trabajo actual.

```bash
ls
```

Lista el contenido del directorio.

```bash
cd <directorio>
```

Cambia el directorio actual.

```bash
mkdir <directorio>
```

Crea un directorio.

```bash
touch <archivo>
```

Crea un archivo vacío o actualiza sus timestamps.

```bash
find <ruta> -type f
```

Busca archivos bajo una ruta.

### Explicación técnica

La administración Linux depende de comprender que prácticamente todo se representa dentro de una jerarquía de filesystem.

Directorios relevantes:

```text
/
├── bin
├── etc
├── home
├── opt
├── tmp
├── usr
└── var
```

El conocimiento del filesystem permite posteriormente comprender:

- permisos;
- procesos;
- logs;
- configuración;
- scripts;
- aplicaciones;
- contenedores.

### Ejecución

La práctica se realizó dentro del entorno Linux/WSL del laboratorio.

### Interpretación

No se trata únicamente de memorizar comandos. La competencia buscada es poder ubicarse dentro del sistema, localizar recursos y comprender dónde vive cada componente.

### Preguntas de entrevista

- ¿Cuál es la diferencia entre `/home`, `/etc` y `/var`?
- ¿Qué diferencia existe entre `cp` y `mv`?
- ¿Para qué utilizarías `find`?
- ¿Por qué es importante conocer el filesystem en DevSecOps?

### Resumen técnico

El filesystem es una de las bases de administración Linux. Sin esta base resulta difícil diagnosticar procesos, servicios, permisos, logs o aplicaciones.

---

## 3.2 Users & Permissions

### Problema

Los sistemas Linux requieren separar identidades y privilegios para evitar que todos los procesos o usuarios operen con permisos excesivos.

### Solución

Trabajar con usuarios, grupos, permisos y privilegios administrativos.

### Código real

El laboratorio incluyó trabajo con:

- usuarios;
- grupos;
- permisos;
- privilegios;
- `sudo`;
- scripts de auditoría.

Entre los scripts de seguridad del repositorio se encuentran:

```text
security/check-sudo-users.sh
security/host-hardening.sh
```

### Sintaxis

Comandos típicos de administración:

```bash
whoami
id
sudo
chmod
chown
```

### Explicación técnica

Linux utiliza un modelo de permisos basado principalmente en:

```text
usuario
grupo
otros
```

y permisos:

```text
read
write
execute
```

En DevSecOps esto se relaciona directamente con:

- least privilege;
- separación de funciones;
- reducción de superficie de ataque;
- ejecución segura de procesos.

### Ejecución

La práctica se realizó sobre el entorno Linux del laboratorio y posteriormente se reforzó el concepto mediante scripts de auditoría.

### Interpretación

Un usuario con privilegios administrativos puede modificar componentes críticos del sistema. Por eso la administración de privilegios forma parte del hardening.

### Preguntas de entrevista

- ¿Qué diferencia hay entre `chmod` y `chown`?
- ¿Qué significa least privilege?
- ¿Por qué no conviene ejecutar aplicaciones como root?
- ¿Qué información entrega `id`?

### Resumen técnico

La gestión de identidades y permisos es una medida preventiva fundamental de seguridad Linux.

---

## 3.3 Process Management

### Problema

Un administrador debe poder identificar qué procesos están ejecutándose, cuánto recurso utilizan y qué proceso puede estar causando un problema.

### Solución

Utilizar herramientas de inspección y administración de procesos.

### Código real

El módulo correspondiente del repositorio trabaja Process Management y forma parte de la progresión Linux → administración → seguridad.

### Sintaxis

Herramientas habituales:

```bash
ps
top
kill
```

### Explicación técnica

Un proceso es una instancia en ejecución de un programa.

Su administración permite investigar:

- consumo de CPU;
- consumo de memoria;
- procesos activos;
- procesos problemáticos;
- terminación controlada.

### Preguntas de entrevista

- ¿Qué diferencia hay entre un proceso y un programa?
- ¿Cuándo utilizarías `kill`?
- ¿Por qué el monitoreo de procesos es relevante para seguridad?

### Resumen técnico

La gestión de procesos es una capacidad operativa necesaria para troubleshooting y administración segura.

---

## 3.4 Networking

### Problema

Una aplicación o servicio no puede administrarse correctamente sin entender conectividad, direccionamiento y resolución de nombres.

### Solución

Practicar hostname, IP, routing, DNS y servicios escuchando.

### Conceptos trabajados

```text
Hostname
IP address
Default gateway
DNS resolver
Routing
Listening services
Private IP
Public IP
```

### Explicación técnica

La práctica permitió diferenciar:

- dirección IP privada;
- gateway;
- resolver DNS;
- dirección pública;
- servicios locales que escuchan conexiones.

### Relación con DevSecOps

Networking es necesario para comprender:

- comunicación entre contenedores;
- exposición de puertos;
- servicios;
- conectividad;
- superficie de ataque.

### Preguntas de entrevista

- ¿Qué función cumple el gateway?
- ¿Qué función cumple DNS?
- ¿Qué diferencia existe entre una IP privada y una pública?
- ¿Qué significa que un servicio esté escuchando en un puerto?

### Resumen técnico

La red es una dependencia transversal de aplicaciones, contenedores, CI/CD y seguridad.

---

## 3.5 System Monitoring

### Problema

No es posible administrar un sistema correctamente sin observar su estado.

### Solución

Utilizar herramientas para revisar uptime, memoria, swap, disco y procesos.

### Conceptos

```text
Uptime
Memory
Swap
Disk
Processes
```

### Explicación técnica

El monitoreo permite distinguir entre:

- comportamiento normal;
- saturación de recursos;
- degradación;
- procesos anómalos;
- problemas de almacenamiento.

### Relación con DevSecOps

El monitoreo forma parte del ciclo operacional posterior al despliegue.

### Preguntas de entrevista

- ¿Qué recursos revisarías primero ante una degradación?
- ¿Qué diferencia hay entre memoria RAM y swap?
- ¿Por qué el monitoreo también tiene valor para seguridad?

### Resumen técnico

Monitorear es observar el estado real del sistema antes de tomar decisiones.

---

## 3.6 Package Management

### Problema

Las aplicaciones dependen de software externo que debe instalarse, actualizarse y mantenerse de forma controlada.

### Solución

Trabajar con APT, repositorios y metadatos de paquetes.

### Conceptos

- APT;
- repositorios;
- package metadata;
- package auditing;
- supply chain security.

### Explicación técnica

Un gestor de paquetes automatiza instalación, actualización y resolución de dependencias.

Desde seguridad, el origen y estado de los paquetes forman parte de la supply chain.

### Preguntas de entrevista

- ¿Qué problema resuelve APT?
- ¿Por qué los repositorios son relevantes para seguridad?
- ¿Qué significa supply chain security?

### Resumen técnico

La gestión de paquetes conecta administración Linux con seguridad de dependencias y supply chain.

---

## 3.7 Linux Hardening

### Problema

Un sistema funcional no necesariamente es un sistema endurecido.

### Solución

Auditar privilegios, puertos, servicios y mecanismos de protección.

### Código real

El repositorio contiene:

```text
security/audit-open-ports.sh
security/check-sudo-users.sh
security/host-hardening.sh
```

### Áreas trabajadas

- usuarios privilegiados;
- puertos abiertos;
- servicios;
- actualizaciones automáticas;
- AppArmor;
- automatización de controles.

### Explicación técnica

Hardening busca reducir la superficie de ataque y limitar condiciones innecesarias.

La idea central es:

```text
menos exposición
+
menos privilegios
+
menos componentes innecesarios
=
menor superficie de ataque
```

### Preguntas de entrevista

- ¿Qué diferencia hay entre hardening y vulnerability scanning?
- ¿Por qué revisar puertos abiertos?
- ¿Qué aporta AppArmor?
- ¿Qué significa reducir superficie de ataque?

### Resumen técnico

Hardening es prevención: modificar la configuración para reducir exposición y privilegios.

---

## 3.8 Bash Scripting

### Problema

Repetir manualmente tareas operativas genera errores y dificulta la estandarización.

### Solución

Automatizar tareas mediante Bash.

### Código real

El repositorio contiene ejercicios sobre:

```text
variables.sh
arguments.sh
if-statement.sh
functions.sh
validation.sh
logging.sh
error-handling.sh
directory-check.sh
```

También existen scripts operacionales como:

```text
scripts/monitor.sh
scripts/system-audit.sh
```

### Sintaxis

Conceptos trabajados:

```bash
VARIABLE="valor"

if [ condicion ]; then
    ...
fi

function nombre() {
    ...
}
```

### Explicación técnica

Bash permite convertir una secuencia manual en un procedimiento reproducible.

La automatización debe considerar:

- argumentos;
- validación;
- condiciones;
- funciones;
- logging;
- manejo de errores.

### Preguntas de entrevista

- ¿Por qué validar argumentos?
- ¿Qué ventaja tiene encapsular lógica en funciones?
- ¿Por qué el manejo de errores es importante en automatización?
- ¿Dónde puede Bash aportar en DevSecOps?

### Resumen técnico

Bash es una herramienta de automatización operacional. Su valor está en hacer procesos repetibles y controlables.

---

## 3.9 Docker Foundations

### Problema

Las aplicaciones necesitan entornos reproducibles y aislados.

### Solución

Utilizar imágenes y contenedores Docker.

### Conceptos

```text
Image
Container
Dockerfile
Registry
Runtime
```

### Explicación técnica

Una imagen contiene el filesystem y configuración necesarios para ejecutar una aplicación.

Un contenedor es una instancia ejecutable de esa imagen.

### Preguntas de entrevista

- ¿Qué diferencia hay entre imagen y contenedor?
- ¿Qué función cumple un Dockerfile?
- ¿Por qué Docker es útil para DevSecOps?

### Resumen técnico

Docker permite empaquetar y ejecutar aplicaciones de forma reproducible, convirtiéndose en una pieza central del Repo 02.

---

## 3.10 Docker Networking

### Problema

Los contenedores necesitan comunicarse entre sí y con el exterior de forma controlada.

### Solución

Trabajar con redes Docker, comunicación entre contenedores y port mapping.

### Laboratorios realizados

```text
Custom Network Creation
Container Communication
Port Mapping
```

### Explicación técnica

Hay que diferenciar:

```text
puerto interno del contenedor
        ↓
puerto publicado en el host
```

Esta distinción será importante en la aplicación Flask del Repo 02.

### Preguntas de entrevista

- ¿Qué función tiene una Docker network?
- ¿Qué diferencia hay entre comunicación interna y port mapping?
- ¿Por qué publicar un puerto modifica la exposición de una aplicación?

### Resumen técnico

Docker networking conecta el conocimiento de redes Linux con la operación de contenedores.

---

## 3.11 Docker Compose

### Problema

Cuando existen varios componentes, ejecutar contenedores manualmente aumenta la complejidad.

### Solución

Utilizar Docker Compose para definir y operar conjuntos de servicios.

### Conceptos trabajados

El módulo 11 del repositorio corresponde a Docker Compose Fundamentals y contiene cuatro laboratorios.

### Explicación técnica

Compose permite describir servicios y su configuración declarativamente.

### Preguntas de entrevista

- ¿Qué problema resuelve Docker Compose?
- ¿Qué significa configuración declarativa?
- ¿Qué ventaja tiene definir infraestructura de contenedores en archivos versionados?

### Resumen técnico

Compose lleva Docker desde la ejecución individual hacia una definición reproducible de múltiples servicios.

---

# 4. REPO 02 — SECURE PIPELINE

Repositorio:

`devsecops-secure-pipeline`

## 4.1 Preparación

### Problema

El pipeline necesita un entorno local donde pueda desarrollarse, validarse y depurarse antes de ejecutarse en GitHub Actions.

### Solución

Se trabajó con:

```text
Windows
  ↓
WSL2
  ↓
Ubuntu
  ↓
VS Code
  ↓
Docker Desktop / WSL integration
  ↓
Git
```

### Problema real: Python y PEP 668

Durante la instalación local de Bandit, el sistema rechazó la instalación global de paquetes Python debido a las restricciones de PEP 668.

### Solución aplicada

Se utilizó un entorno virtual:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Bandit se instaló dentro del entorno virtual.

### Decisión técnica

No se utilizó:

```bash
--break-system-packages
```

La solución preservó el aislamiento del entorno Python.

### Preguntas de entrevista

- ¿Qué problema resuelve un virtual environment?
- ¿Qué significa PEP 668?
- ¿Por qué no es recomendable forzar la instalación sobre el Python administrado por el sistema?

### Resumen técnico

El troubleshooting de entorno también forma parte de la competencia DevSecOps.

---

## 4.2 Python / Flask

### Problema

Se necesitaba una aplicación simple sobre la cual ejecutar controles de seguridad.

### Solución

Aplicación Flask mínima.

### Código real

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "DevSecOps App Running 🚀"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

### Sintaxis

```python
app = Flask(__name__)
```

crea la aplicación.

```python
@app.route("/")
```

define la ruta HTTP.

```python
app.run(host="0.0.0.0", port=5000)
```

inicia el servidor en el puerto 5000 y permite recibir conexiones desde las interfaces disponibles del contenedor.

### Explicación técnica

La aplicación es deliberadamente simple. Su función principal dentro del proyecto es servir como workload real para:

- Docker;
- SAST;
- vulnerability scanning;
- CI/CD;
- security policy.

### Hallazgo relevante

Bandit identificó:

```text
B104
```

asociado al uso de:

```python
host="0.0.0.0"
```

La decisión fue no modificar inmediatamente el código para silenciar el hallazgo, porque el valor está relacionado con la forma en que una aplicación debe escuchar dentro de un contenedor.

### Preguntas de entrevista

- ¿Por qué se utiliza `0.0.0.0` dentro de un contenedor?
- ¿Qué diferencia hay entre `127.0.0.1` y `0.0.0.0`?
- ¿Por qué un finding de SAST no debe solucionarse automáticamente sin analizar el contexto?

### Resumen técnico

La aplicación Flask es el workload sobre el cual se aplican los controles DevSecOps.

---

## 4.3 Docker

### Problema

La aplicación necesita ejecutarse de forma reproducible y debe convertirse en un artefacto escaneable.

### Solución

Crear una imagen Docker mediante un Dockerfile.

### Código real

```dockerfile
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN useradd -m appuser

WORKDIR /app

COPY app/ /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
```

### Sintaxis

```dockerfile
FROM
```

define la imagen base.

```dockerfile
RUN
```

ejecuta instrucciones durante el build.

```dockerfile
COPY
```

copia archivos al filesystem de la imagen.

```dockerfile
USER
```

define el usuario de ejecución.

```dockerfile
EXPOSE
```

documenta el puerto utilizado por la aplicación.

```dockerfile
CMD
```

define el comando por defecto.

### Ejecución real

La imagen fue construida localmente con:

```bash
docker build --no-cache -t devsecops-app:v2 .
```

La aplicación fue ejecutada y validada mediante:

```bash
docker run --rm -d \
  --name devsecops-app-v2 \
  -p 5000:5000 \
  devsecops-app:v2
```

La aplicación respondió correctamente mediante:

```bash
curl http://localhost:5000
```

Resultado:

```text
DevSecOps App Running 🚀
```

### Interpretación

La aplicación funcionó dentro del contenedor y el puerto 5000 fue publicado al host.

### Preguntas de entrevista

- ¿Qué diferencia existe entre `docker build` y `docker run`?
- ¿Qué hace `-p 5000:5000`?
- ¿Por qué se utiliza `python:3.12-slim`?
- ¿Por qué ejecutar como usuario no root?

### Resumen técnico

Docker convierte la aplicación en un artefacto reproducible que puede analizarse automáticamente.

---

## 4.4 Trivy

### Problema

Una imagen puede funcionar correctamente y aun así contener vulnerabilidades conocidas.

### Solución

Analizar la imagen mediante Trivy.

### Versión utilizada

```text
Trivy 0.74.0
```

### Comando de reporte

```bash
trivy image \
  --scanners vuln \
  --format json \
  -o reports/trivy-report.json \
  devsecops-app
```

### Sintaxis

```text
trivy image
```

indica que el objetivo es una imagen.

```text
--scanners vuln
```

limita el análisis al scanner de vulnerabilidades.

```text
--format json
```

produce un reporte estructurado.

```text
-o
```

guarda el resultado.

### Resultado observado

El análisis local de la imagen `devsecops-app:v2` detectó:

```text
44 HIGH
0 CRITICAL
```

en la capa Debian analizada.

El análisis completo también mostró vulnerabilidades de otras severidades.

### Interpretación

La existencia de vulnerabilidades no significa automáticamente que el pipeline deba fallar.

Se debe distinguir entre:

```text
vulnerability report
        ≠
security gate
```

### Preguntas de entrevista

- ¿Qué diferencia hay entre vulnerability scanning y SAST?
- ¿Por qué una vulnerabilidad reportada no necesariamente bloquea el pipeline?
- ¿Qué significa `HIGH`?
- ¿Qué significa `--ignore-unfixed`?

### Resumen técnico

Trivy proporciona visibilidad sobre vulnerabilidades de las imágenes y alimenta la decisión de seguridad del pipeline.

---

## 4.5 Bandit / SAST

### Problema

Las vulnerabilidades también pueden originarse en el código fuente, antes de construir la imagen.

### Solución

Utilizar Bandit como herramienta SAST para Python.

### Versión

```text
Bandit 1.9.4
```

### Código del pipeline

```bash
bandit -r app/ -f txt -o reports/bandit-report.txt || true
```

### Explicación

```text
-r app/
```

analiza recursivamente la aplicación.

```text
-f txt
```

genera formato texto.

```text
-o
```

especifica el archivo de salida.

```text
|| true
```

impide que el finding de Bandit detenga este job.

### Hallazgo real

Se detectó:

```text
B104
```

en:

```text
app/app.py
```

por:

```python
host="0.0.0.0"
```

### Decisión

El hallazgo fue documentado y analizado, pero no se cambió el código solamente para hacer desaparecer el warning.

### Interpretación

El proyecto utiliza Bandit como control informativo, mientras que Trivy constituye el gate explícito de vulnerabilidades de imagen.

### Preguntas de entrevista

- ¿Qué significa SAST?
- ¿Qué diferencia hay entre SAST y DAST?
- ¿Por qué `|| true` modifica el comportamiento del pipeline?
- ¿Eliminar un warning siempre significa mejorar seguridad?

### Resumen técnico

SAST analiza el código fuente; su valor depende de interpretar los hallazgos dentro del contexto de ejecución.

---

## 4.6 GitHub Actions

### Problema

Los controles de seguridad ejecutados manualmente no garantizan que se apliquen en cada cambio.

### Solución

Automatizar el proceso mediante GitHub Actions.

### Archivo real

```text
.github/workflows/trivy-scan.yml
```

### Estructura principal

```yaml
name: DevSecOps Secure Pipeline

on:
  pull_request:
    branches: [ "main" ]
  push:
    branches: [ "main" ]

jobs:
  security-pipeline:
    runs-on: ubuntu-latest
```

### Flujo real

```text
Checkout
   ↓
Python 3.12
   ↓
Bandit
   ↓
Bandit Artifact
   ↓
Docker Build
   ↓
Trivy
   ↓
Trivy Artifact
   ↓
Security Gate
```

### Eventos

El workflow se ejecuta ante:

- Pull Request hacia `main`;
- Push hacia `main`.

### Interpretación

Esto integra seguridad en el ciclo de cambio del código.

### Preguntas de entrevista

- ¿Qué es GitHub Actions?
- ¿Qué diferencia existe entre `pull_request` y `push`?
- ¿Qué función cumple `runs-on`?
- ¿Qué es un job?
- ¿Qué es un step?

### Resumen técnico

GitHub Actions automatiza la ejecución repetible de controles técnicos.

---

## 4.7 Artifacts

### Problema

El resultado de una herramienta de seguridad no debe desaparecer cuando termina el job.

### Solución

Guardar reportes como artifacts.

### Bandit

```yaml
- name: Upload Bandit report
  uses: actions/upload-artifact@v4
  with:
    name: bandit-report
    path: reports/bandit-report.txt
```

### Trivy

```yaml
- name: Upload Trivy report
  uses: actions/upload-artifact@v4
  with:
    name: trivy-report
    path: reports/trivy-report.json
```

### Explicación técnica

Los artifacts permiten conservar resultados producidos durante la ejecución del workflow.

### Preguntas de entrevista

- ¿Qué es un artifact en GitHub Actions?
- ¿Por qué conservar un reporte de seguridad?
- ¿Qué diferencia existe entre artifact y código fuente?

### Resumen técnico

Los artifacts proporcionan evidencia y trazabilidad del análisis realizado por el pipeline.

---

## 4.8 Security Gate

### Problema

Un reporte por sí solo no aplica una política.

### Solución

Definir una condición que determine cuándo el pipeline debe fallar.

### Código real

```bash
trivy image \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --exit-code 1 \
  devsecops-app
```

### Sintaxis

```text
--severity HIGH,CRITICAL
```

limita la evaluación a esas severidades.

```text
--ignore-unfixed
```

excluye vulnerabilidades que no tienen corrección disponible.

```text
--exit-code 1
```

hace que Trivy devuelva código de salida 1 cuando encuentra hallazgos que cumplen la política.

### Política implementada

El gate bloquea cuando existen:

```text
HIGH o CRITICAL
+
fix disponible
```

Las vulnerabilidades sin corrección disponible pueden permanecer en el reporte sin provocar el fallo del gate.

### Interpretación

Esto demuestra una diferencia importante:

```text
Detección
    ↓
Evaluación
    ↓
Política
    ↓
Decisión
```

### Preguntas de entrevista

- ¿Qué es un security gate?
- ¿Por qué no bloquear por cualquier vulnerabilidad?
- ¿Qué significa `exit-code 1`?
- ¿Qué ventaja tiene `--ignore-unfixed`?

### Resumen técnico

El security gate convierte información de seguridad en una decisión automatizada.

---

## 4.9 Docker Hardening

### Problema

Una imagen funcional puede tener configuraciones innecesariamente expuestas.

### Solución implementada

El Dockerfile fue endurecido mediante:

1. imagen `python:3.12-slim`;
2. usuario no root;
3. permisos de aplicación;
4. dependencias explícitas;
5. desactivación de `.pyc`;
6. salida Python sin buffering;
7. puerto de aplicación definido.

### Usuario no root

```dockerfile
RUN useradd -m appuser
...
USER appuser
```

Esto evita ejecutar la aplicación como root.

### Permisos

```dockerfile
RUN chown -R appuser:appuser /app
```

permite que el usuario de ejecución controle la aplicación.

### Variables

```dockerfile
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
```

### Validación

La imagen fue inspeccionada para comprobar:

```text
User=appuser
Entrypoint=[]
Cmd=[python app.py]
```

También se ejecutó funcionalmente y respondió correctamente por HTTP.

### Preguntas de entrevista

- ¿Por qué un contenedor no debería ejecutar la aplicación como root?
- ¿Qué aporta una imagen slim?
- ¿Qué diferencia hay entre hardening y scanning?
- ¿Por qué validar el usuario efectivo del contenedor?

### Resumen técnico

Docker hardening reduce privilegios y superficie de ataque del runtime.

---

# 5. INTEGRACIÓN ENTRE AMBOS REPOSITORIOS

La relación técnica puede resumirse así:

```text
REPO 01
Linux
├── Filesystem
├── Permissions
├── Processes
├── Networking
├── Monitoring
├── Packages
├── Hardening
├── Bash
└── Docker
        ↓
REPO 02
Application
├── Python / Flask
├── Docker
├── Bandit
├── Trivy
├── GitHub Actions
├── Artifacts
├── Security Gate
└── Docker Hardening
```

## 5.1 Ejemplo de integración

El conocimiento de networking del Repo 01 permite comprender por qué:

```python
app.run(host="0.0.0.0", port=5000)
```

y:

```bash
-p 5000:5000
```

tienen sentido dentro del contenedor.

El conocimiento de usuarios y permisos permite comprender:

```dockerfile
USER appuser
```

El conocimiento de Docker permite comprender por qué Trivy analiza una imagen.

El conocimiento de Git permite comprender por qué un `push` puede activar GitHub Actions.

La integración es el aprendizaje principal.

---

# 6. CONCEPTOS DEVSECOPS

## 6.1 CI/CD

CI/CD automatiza etapas del ciclo de integración y entrega.

En este proyecto:

```text
Git change
   ↓
GitHub
   ↓
GitHub Actions
   ↓
Security checks
   ↓
Decision
```

## 6.2 SAST

Static Application Security Testing.

Busca problemas en el código fuente sin ejecutar la aplicación.

Herramienta utilizada:

```text
Bandit
```

## 6.3 Vulnerability Management

Busca vulnerabilidades conocidas en componentes.

Herramienta utilizada:

```text
Trivy
```

## 6.4 Container Security

Incluye:

- análisis de imágenes;
- reducción de superficie;
- usuario no root;
- control de dependencias;
- configuración segura.

## 6.5 Security Policy

Una herramienta entrega datos.

La política define qué datos provocan una decisión.

## 6.6 Shift Left

Los controles se incorporan temprano en el ciclo de desarrollo.

En este proyecto:

```text
Código
 ↓
Bandit
 ↓
Build
 ↓
Trivy
 ↓
Policy
```

---

# 7. TROUBLESHOOTING REAL

## 7.1 PEP 668

### Problema

La instalación global de paquetes Python fue bloqueada por el entorno administrado por el sistema.

### Solución

Crear `.venv` y trabajar dentro del entorno virtual.

### Aprendizaje

No todo error debe solucionarse forzando la herramienta. Primero se debe comprender la protección que está produciendo el error.

---

## 7.2 Bandit B104

### Problema

Bandit identificó `0.0.0.0`.

### Decisión

No eliminar el warning sin analizar el contexto.

### Aprendizaje

Un finding debe interpretarse técnicamente.

---

## 7.3 Trivy y vulnerabilidades sin fix

### Problema

La imagen mostró vulnerabilidades HIGH.

### Decisión

El reporte conserva visibilidad, pero el gate considera solamente HIGH/CRITICAL con corrección disponible.

### Aprendizaje

Detectar no es lo mismo que bloquear.

---

## 7.4 Docker

### Problema

Era necesario demostrar que el contenedor no solo construía, sino que ejecutaba correctamente la aplicación.

### Validación

```bash
docker build
docker run
curl
docker logs
docker ps
```

### Aprendizaje

Build exitoso no equivale a aplicación funcional.

---

## 7.5 Git / Remotes

### Problema real

Durante el desarrollo existió un remote asociado al repositorio anterior:

```text
juvenalmaster-cmd
```

El remote fue corregido al repositorio actual:

```text
JuvenalMunozR/devsecops-secure-pipeline
```

### Aprendizaje

Git remote es parte de la configuración operacional del repositorio y debe verificarse cuando un push falla.

---

## 7.6 GitHub Actions

### Problema

Las ejecuciones históricas contienen resultados de versiones anteriores del pipeline.

### Interpretación

Los checks antiguos forman parte de la historia del proyecto y no deben confundirse con la versión final validada.

### Estado final

La versión actual del workflow fue ejecutada correctamente para:

- Pull Request;
- merge;
- ejecución sobre `main`.

---

# 8. ENGINEERING DECISIONS

## ED-001 — Separación de responsabilidades

Repo 01 y Repo 02 se mantienen como proyectos separados.

**Motivo:** cada repositorio tiene un propósito pedagógico y técnico distinto.

## ED-002 — Bandit informativo

Bandit genera reporte pero no bloquea.

**Motivo:** el hallazgo B104 debe analizarse dentro del contexto de ejecución de Flask en Docker.

## ED-003 — Trivy como Security Gate

Trivy bloquea HIGH/CRITICAL con fix disponible.

**Motivo:** convertir vulnerabilidades accionables en una política automática.

## ED-004 — Usuario no root

La aplicación se ejecuta como `appuser`.

**Motivo:** reducir privilegios del proceso dentro del contenedor.

## ED-005 — No modificar el código para silenciar findings

Un warning de seguridad no debe eliminarse sin comprender su causa.

**Motivo:** la calidad de un pipeline depende de la interpretación, no solamente de obtener una ejecución verde.

---

# 9. CÓMO INTERPRETAR RESULTADOS

## 9.1 Resultado verde

No significa:

> "No existe ninguna vulnerabilidad."

Significa:

> "La ejecución cumplió la política definida para ese pipeline."

## 9.2 Reporte con vulnerabilidades

No significa automáticamente:

> "El proyecto está mal."

Significa:

> "El scanner encontró condiciones que deben evaluarse."

## 9.3 Finding SAST

No significa automáticamente:

> "Hay que cambiar el código."

Significa:

> "Existe una condición que debe ser revisada."

## 9.4 Build exitoso

No significa:

> "La aplicación funciona."

Hay que validar runtime.

## 9.5 Contenedor ejecutando

No significa:

> "El contenedor es seguro."

Hay que revisar:

- usuario;
- imagen;
- dependencias;
- vulnerabilidades;
- exposición;
- configuración.

---

# 10. PREGUNTAS DE ENTREVISTA

## Linux

1. ¿Cómo investigarías un problema de recursos en Linux?
2. ¿Qué diferencia existe entre usuario, grupo y root?
3. ¿Qué significa least privilege?
4. ¿Cómo revisarías procesos?
5. ¿Cómo revisarías puertos abiertos?

## Docker

1. ¿Qué diferencia hay entre imagen y contenedor?
2. ¿Qué función tiene un Dockerfile?
3. ¿Qué hace `USER appuser`?
4. ¿Qué significa publicar `5000:5000`?
5. ¿Por qué utilizar una imagen slim?

## Bandit

1. ¿Qué es SAST?
2. ¿Qué analiza Bandit?
3. ¿Qué significa B104?
4. ¿Por qué no eliminaste B104 automáticamente?
5. ¿Qué efecto tiene `|| true`?

## Trivy

1. ¿Qué analiza Trivy en este proyecto?
2. ¿Qué diferencia hay entre reporte y gate?
3. ¿Qué hace `--ignore-unfixed`?
4. ¿Qué hace `--exit-code 1`?
5. ¿Por qué utilizar HIGH y CRITICAL?

## GitHub Actions

1. ¿Qué es un workflow?
2. ¿Qué es un job?
3. ¿Qué es un step?
4. ¿Qué diferencia existe entre `push` y `pull_request`?
5. ¿Qué es un artifact?

## DevSecOps

1. ¿Qué significa Shift Left?
2. ¿Dónde está integrado seguridad en este proyecto?
3. ¿Qué diferencia hay entre SAST y vulnerability scanning?
4. ¿Qué es una security policy?
5. ¿Qué significa automatizar seguridad en CI/CD?

---

# 11. EJERCICIOS DE CONSOLIDACIÓN

## Ejercicio 1 — Linux

Explicar sin consultar documentación:

```text
/
├── etc
├── home
├── tmp
├── usr
└── var
```

y explicar qué tipo de información esperarías encontrar en cada directorio.

## Ejercicio 2 — Permisos

Explicar:

```text
rwx
r-x
---
```

para usuario, grupo y otros.

## Ejercicio 3 — Docker

Explicar el recorrido:

```text
Dockerfile
    ↓
docker build
    ↓
Image
    ↓
docker run
    ↓
Container
```

## Ejercicio 4 — Security scanning

Explicar la diferencia:

```text
Bandit
  ↓
Código fuente

Trivy
  ↓
Imagen / dependencias
```

## Ejercicio 5 — Security Gate

Explicar por qué:

```bash
--severity HIGH,CRITICAL
--ignore-unfixed
--exit-code 1
```

transforman el análisis en una política.

## Ejercicio 6 — Pipeline

Explicar de memoria:

```text
Pull Request
    ↓
GitHub Actions
    ↓
Bandit
    ↓
Docker Build
    ↓
Trivy
    ↓
Security Gate
```

---

# 12. QUÉ SIGNIFICA "DOMINAR" CADA TECNOLOGÍA

## Linux

Dominar significa poder:

- navegar;
- administrar usuarios;
- interpretar permisos;
- revisar procesos;
- diagnosticar networking;
- monitorear recursos;
- administrar paquetes;
- aplicar hardening;
- automatizar con Bash.

## Git

Dominar significa poder:

- trabajar con branches;
- crear commits;
- sincronizar remotes;
- resolver problemas de push/pull;
- interpretar el estado del repositorio;
- comprender el historial.

## Docker

Dominar significa poder:

- escribir un Dockerfile;
- construir una imagen;
- ejecutar un contenedor;
- publicar puertos;
- configurar redes;
- interpretar logs;
- aplicar hardening básico.

## Bandit

Dominar significa poder:

- ejecutar SAST;
- interpretar findings;
- diferenciar warning de vulnerabilidad explotable;
- entender severidad y confianza;
- decidir si un finding debe corregirse, documentarse o aceptarse.

## Trivy

Dominar significa poder:

- escanear imágenes;
- interpretar CVEs;
- diferenciar severidades;
- distinguir fixed/unfixed;
- generar reportes;
- implementar un security gate.

## GitHub Actions

Dominar significa poder:

- leer YAML;
- entender triggers;
- entender jobs y steps;
- ejecutar herramientas;
- almacenar artifacts;
- implementar condiciones de seguridad.

## DevSecOps

Dominar significa poder explicar cómo todas las tecnologías anteriores forman un flujo coherente.

---


## 11.7 CONSOLIDACIÓN PRÁCTICA SOBRE LOS REPOSITORIOS

La consolidación final se realiza sobre los dos repositorios existentes. No se crea un tercer proyecto ni se agregan tecnologías fuera del alcance del Bootcamp.

El objetivo es demostrar que las competencias pueden ejecutarse, interpretarse y defenderse técnicamente.

### Tech Skill 01 — Linux Operations

**Repositorio:** `devsecops-linux-lab`

Debe ser posible:

- navegar y comprender el filesystem;
- administrar usuarios, grupos y permisos;
- identificar y gestionar procesos;
- diagnosticar networking básico;
- revisar consumo de recursos;
- administrar paquetes;
- aplicar hardening;
- ejecutar scripts Bash;
- comprender Docker desde Linux.

**Criterio de dominio:** no basta con ejecutar un comando. Se debe poder explicar qué información entrega, qué problema permite diagnosticar y qué decisión técnica puede derivarse del resultado.

### Tech Skill 02 — Container Engineering

**Repositorio:** `devsecops-secure-pipeline`

Debe ser posible:

- leer y explicar el Dockerfile;
- construir una imagen;
- ejecutar un contenedor;
- comprender `EXPOSE` y el port mapping;
- comprender Docker networking;
- interpretar logs;
- identificar el usuario de ejecución;
- explicar por qué la aplicación se ejecuta como `appuser`.

**Criterio de dominio:** poder explicar la diferencia entre imagen, contenedor, puerto interno, puerto publicado y usuario de ejecución.

### Tech Skill 03 — Application Security / SAST

**Herramienta:** Bandit

Debe ser posible:

- ejecutar el análisis SAST;
- interpretar findings;
- comprender severidad y confianza;
- analizar el contexto del finding;
- distinguir entre corregir, documentar o aceptar un hallazgo.

**Hallazgo real trabajado:** `B104`, asociado al uso de `0.0.0.0` en Flask.

La decisión técnica no fue eliminar el hallazgo automáticamente, sino comprender por qué la aplicación necesita escuchar en las interfaces disponibles del contenedor.

**Criterio de dominio:** poder explicar por qué un finding no debe corregirse simplemente para que la herramienta quede en verde.

### Tech Skill 04 — Vulnerability Management

**Herramienta:** Trivy

Debe ser posible:

- escanear una imagen;
- interpretar CVEs;
- diferenciar severidades;
- distinguir vulnerabilidades fixed y unfixed;
- generar un reporte;
- explicar un Security Gate.

La política implementada utiliza:

```bash
trivy image \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --exit-code 1 \
  devsecops-app
```

**Criterio de dominio:** distinguir claramente entre una vulnerabilidad encontrada en el reporte y una vulnerabilidad que, según la política definida, debe bloquear el pipeline.

### Tech Skill 05 — CI/CD Security

**Archivo:** `.github/workflows/trivy-scan.yml`

Debe ser posible explicar el flujo completo:

```text
Git
 ↓
GitHub
 ↓
Pull Request / Push
 ↓
GitHub Actions
 ↓
Bandit
 ↓
Bandit Artifact
 ↓
Docker Build
 ↓
Trivy
 ↓
Trivy Artifact
 ↓
Security Gate
```

Debe comprenderse la función de cada etapa:

- Bandit analiza el código fuente;
- Docker Build genera la imagen;
- Trivy analiza la imagen;
- los artifacts conservan evidencia;
- el Security Gate aplica la política.

**Criterio de dominio:** poder leer el YAML y explicar qué ocurre desde el evento Git hasta la decisión de seguridad.

### Tech Skill 06 — Engineering Decision Making

Para cada control implementado se debe poder responder:

1. ¿Cuál era el problema?
2. ¿Cuál fue la solución?
3. ¿Por qué se eligió esa solución?
4. ¿Qué alternativa existía?
5. ¿Qué riesgo permanece?
6. ¿Cómo se validó?

La competencia de ingeniería aparece cuando una solución puede ser defendida con evidencia y no solamente con una definición teórica.

---

## 11.8 CONSOLIDACIÓN EJECUTABLE

La consolidación se realizará sobre los repositorios reales siguiendo este flujo:

```text
Ejecutar
   ↓
Observar
   ↓
Interpretar
   ↓
Diagnosticar
   ↓
Decidir
   ↓
Explicar
   ↓
Defender
```

### Fase A — Repo 01

Validar las competencias fundamentales:

- filesystem;
- usuarios y permisos;
- procesos;
- networking;
- monitoring;
- package management;
- hardening;
- Bash;
- Docker;
- Docker networking;
- Docker Compose.

La evidencia existente en `docs/`, `labs/`, `scripts/`, `security/`, `reports/` y `study/` constituye la base documental de esta fase.

### Fase B — Repo 02

Validar el flujo completo de aplicación y seguridad:

```text
Python / Flask
 ↓
Docker Build
 ↓
Container Runtime
 ↓
Bandit
 ↓
Trivy
 ↓
GitHub Actions
 ↓
Artifacts
 ↓
Security Gate
```

### Fase C — Integración

La prueba final consiste en explicar cómo los conocimientos del Repo 01 permiten comprender y operar el Repo 02.

Ejemplos:

- permisos Linux → usuario no root en Docker;
- networking Linux → networking Docker;
- Bash → automatización;
- paquetes → supply chain;
- hardening Linux → Docker hardening;
- Git → GitHub;
- operación Linux → operación del pipeline.

---

## 11.9 CRITERIOS DE CIERRE DEL BOOTCAMP

El Bootcamp queda técnicamente cerrado cuando se cumplen estas condiciones:

- [ ] Repo 01 permanece funcional y documentado.
- [ ] Repo 02 permanece funcional y documentado.
- [ ] La guía V2 está versionada en Repo 02.
- [ ] La aplicación Flask funciona dentro del contenedor.
- [ ] El contenedor utiliza usuario no root.
- [ ] Bandit está integrado al pipeline.
- [ ] Trivy está integrado al pipeline.
- [ ] Los reportes se generan como artifacts.
- [ ] El Security Gate está definido y comprendido.
- [ ] Docker Hardening está implementado y validado.
- [ ] Los problemas reales del laboratorio pueden explicarse.
- [ ] Las decisiones técnicas pueden defenderse.
- [ ] No existen tareas pendientes dentro del alcance definido del Bootcamp.

El cierre no significa que no existan futuras mejoras posibles. Significa que el alcance definido fue construido, validado, documentado y comprendido.

---

## 12.1 MATRIZ FINAL DE DOMINIO

| Competencia | Ejecutar | Comprender | Interpretar | Defender |
|---|---:|---:|---:|---:|
| Linux | ✓ | ✓ | ✓ | ✓ |
| Git / GitHub | ✓ | ✓ | ✓ | ✓ |
| Bash | ✓ | ✓ | ✓ | ✓ |
| Networking | ✓ | ✓ | ✓ | ✓ |
| Docker | ✓ | ✓ | ✓ | ✓ |
| Docker Networking | ✓ | ✓ | ✓ | ✓ |
| Docker Compose | ✓ | ✓ | ✓ | ✓ |
| Python / Flask | ✓ | ✓ | ✓ | ✓ |
| Bandit / SAST | ✓ | ✓ | ✓ | ✓ |
| Trivy | ✓ | ✓ | ✓ | ✓ |
| GitHub Actions | ✓ | ✓ | ✓ | ✓ |
| Security Reports | ✓ | ✓ | ✓ | ✓ |
| Security Gate | ✓ | ✓ | ✓ | ✓ |
| Docker Hardening | ✓ | ✓ | ✓ | ✓ |
| DevSecOps | ✓ | ✓ | ✓ | ✓ |

Esta matriz representa el objetivo de consolidación del Bootcamp: transformar herramientas aisladas en competencias técnicas relacionadas.

---

## 12.2 REGLA DE CONTINUIDAD DEL ENGINEERING PORTFOLIO

El siguiente repositorio no debe comenzar simplemente porque el anterior fue construido.

Debe comenzar cuando la competencia alcanzó el nivel suficiente para: ejecutar, comprender, interpretar y defender técnicamente lo realizado.

Por lo tanto, la consolidación de estos dos repositorios es parte del Engineering Portfolio y no una actividad adicional separada de ellos.

# 13. RESUMEN TÉCNICO FINAL

El trabajo realizado construyó una progresión técnica concreta.

Primero se desarrolló la base operacional con Linux, Bash, networking, permisos, hardening y Docker.

Después esa base se utilizó para construir una aplicación Flask contenida en Docker.

Sobre esa aplicación se integraron:

```text
Bandit
  ↓
SAST

Docker
  ↓
Containerization

Trivy
  ↓
Vulnerability Scanning

GitHub Actions
  ↓
CI/CD Automation

Artifacts
  ↓
Evidence

Security Gate
  ↓
Policy Enforcement

Docker Hardening
  ↓
Reduced Runtime Risk
```

El resultado no es solamente un pipeline que termina en verde.

El resultado técnico es comprender el recorrido:

```text
Código
 ↓
Commit
 ↓
GitHub
 ↓
Pipeline
 ↓
SAST
 ↓
Build
 ↓
Vulnerability Scan
 ↓
Security Policy
 ↓
Decision
 ↓
Evidence
```

La competencia que se debe consolidar a partir de estos repositorios es poder:

1. ejecutar;
2. entender;
3. diagnosticar;
4. interpretar;
5. explicar;
6. defender técnicamente una decisión.

Ese es el objetivo de esta guía y la base para continuar el Engineering Portfolio sin saltar prematuramente a nuevas tecnologías.

