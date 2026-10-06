# Bootcamp DevSecOps V2

## 1. Propósito y metodología

### 1.1 Propósito

Este documento consolida el aprendizaje técnico desarrollado mediante los repositorios:

- `devsecops-linux-lab`
- `devsecops-secure-pipeline`

El objetivo no es solamente documentar comandos o herramientas. El objetivo es comprender, ejecutar, interpretar y defender técnicamente las decisiones realizadas durante la construcción de ambos laboratorios.

El recorrido parte desde la administración de un entorno Linux y evoluciona progresivamente hacia la automatización, la contenerización, el análisis de seguridad y la integración de controles de seguridad dentro de un pipeline CI/CD.

### 1.2 Alcance

El bootcamp integra los siguientes dominios técnicos:

- Linux y administración de sistemas
- Sistema de archivos, usuarios y permisos
- Procesos y monitoreo
- Networking
- Gestión de paquetes
- Linux Hardening
- Bash scripting
- Docker
- Docker Networking
- Docker Compose
- Python y Flask
- SAST con Bandit
- Vulnerability Scanning con Trivy
- Git y GitHub
- GitHub Actions
- Security Reports
- Security Gates
- Docker Hardening
- Principios DevSecOps

El contenido se basa en el trabajo realizado y validado en los dos repositorios.

### 1.3 Metodología de aprendizaje

Cada concepto técnico será estudiado siguiendo una estructura constante:

1. **Problema** — qué problema técnico estamos resolviendo.
2. **Solución** — qué estrategia utilizamos para resolverlo.
3. **Código real** — qué existe realmente en los repositorios.
4. **Sintaxis** — qué significa cada comando, parámetro, archivo o configuración.
5. **Explicación técnica** — cómo funciona la solución y qué ocurre técnicamente.
6. **Ejecución** — cómo se ejecuta y valida en el entorno real.
7. **Interpretación de resultados** — qué significa el resultado obtenido y qué decisiones permite tomar.
8. **Preguntas de entrevista** — cómo explicar y defender técnicamente lo realizado.
9. **Resumen técnico** — qué debemos ser capaces de explicar y aplicar sin depender de apuntes.

### 1.4 Principio de trabajo

El objetivo final es pasar de:

> "Sé ejecutar el comando."

a:

> "Entiendo qué problema resuelve, cómo funciona, por qué utilizamos esta solución, cómo interpreto su resultado y puedo defender técnicamente la decisión."

Por esta razón, los comandos y configuraciones no se estudiarán de forma aislada. Cada elemento deberá relacionarse con el problema que resuelve, el contexto en que fue utilizado y su función dentro de la arquitectura general.

### 1.5 Resultado esperado

Al finalizar este bootcamp se debe poder explicar técnicamente el recorrido completo desde la administración de un entorno Linux hasta la incorporación de controles de seguridad en un pipeline CI/CD.

El resultado esperado es desarrollar capacidad para:

- comprender el funcionamiento de las tecnologías utilizadas;
- ejecutar las soluciones implementadas;
- interpretar resultados y hallazgos;
- identificar problemas técnicos;
- justificar decisiones de ingeniería;
- explicar controles de seguridad;
- defender el proyecto en una entrevista técnica.

## 2. Mapa general del Engineering Portfolio

### 2.1 Visión general

El Engineering Portfolio se construye de forma progresiva. Cada repositorio representa una etapa del desarrollo técnico y prepara las competencias necesarias para la siguiente.

El recorrido desarrollado hasta este punto se estructura en dos repositorios principales:

```text
REPO 01 — devsecops-linux-lab
        |
        +-- Linux Administration
        +-- Filesystem
        +-- Users & Permissions
        +-- Process Management
        +-- Networking
        +-- System Monitoring
        +-- Package Management
        +-- Linux Hardening
        +-- Bash Scripting
        +-- Docker Foundations
        +-- Docker Networking
        +-- Docker Compose
                |
                v
REPO 02 — devsecops-secure-pipeline
        |
        +-- Python / Flask
        +-- Docker
        +-- Bandit / SAST
        +-- Trivy
        +-- GitHub Actions
        +-- Security Reports
        +-- Security Gate
        +-- Docker Hardening
                |
                v
             DevSecOps
```

### 2.2 Repo 01 — Fundación técnica

`devsecops-linux-lab` representa la base operacional del recorrido.

El objetivo de este repositorio fue desarrollar competencias para trabajar directamente con un entorno Linux, comprender sus componentes fundamentales y establecer una base para tareas posteriores de automatización, contenedores y seguridad.

La progresión técnica fue:

```text
Linux -> Filesystem -> Users & Permissions -> Process Management
     -> Networking -> System Monitoring -> Package Management
     -> Linux Hardening -> Bash Scripting -> Docker
     -> Docker Networking -> Docker Compose
```

Esta etapa permite comprender el sistema sobre el cual posteriormente se ejecutan aplicaciones, contenedores y controles de seguridad.

### 2.3 Repo 02 — Seguridad integrada al pipeline

`devsecops-secure-pipeline` utiliza parte de la base construida en el Repo 01 y la lleva hacia un escenario de desarrollo y entrega de software con controles de seguridad.

La progresión técnica es:

```text
Python / Flask -> Docker -> Bandit / SAST -> Trivy
             -> GitHub Actions -> Security Reports
             -> Security Gate -> Docker Hardening
```

En esta etapa la seguridad deja de ser solamente una actividad manual y comienza a integrarse en el proceso de construcción y validación de la aplicación.

### 2.4 Relación entre ambos repositorios

Los repositorios no deben entenderse como proyectos independientes.

El Repo 01 desarrolla la base operacional necesaria para comprender:

- el sistema operativo;
- archivos y permisos;
- procesos;
- networking;
- paquetes;
- hardening;
- scripting;
- contenedores;
- redes de contenedores.

El Repo 02 utiliza ese conocimiento dentro de un flujo orientado a la seguridad de aplicaciones y de la cadena de entrega:

- construcción de una aplicación;
- creación de una imagen Docker;
- análisis SAST;
- análisis de vulnerabilidades;
- automatización mediante GitHub Actions;
- generación de reportes;
- aplicación de una política de seguridad;
- endurecimiento del contenedor.

Por lo tanto:

```text
Repo 01 = Foundation
Repo 02 = Security Integration
```

### 2.5 Evolución de la competencia técnica

El aprendizaje puede representarse en tres niveles:

#### Nivel 1 — Operacional

Capacidad para ejecutar una tarea correctamente.

Ejemplo: ejecutar un escaneo Trivy.

#### Nivel 2 — Técnico

Capacidad para comprender qué hace la herramienta y cómo interpretar su resultado.

Ejemplo: explicar qué analiza Trivy, qué significa una vulnerabilidad HIGH y por qué una vulnerabilidad puede o no bloquear el pipeline.
