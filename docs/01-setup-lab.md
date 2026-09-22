# Módulo 1 — Preparación del laboratorio

## Objetivo

Preparar el entorno de trabajo utilizado para desarrollar y validar el laboratorio DevSecOps.

El objetivo es disponer de un entorno reproducible para trabajar con:

- Python.
- Docker.
- Git.
- GitHub.
- Bandit.
- Trivy.
- GitHub Actions.

---

## Repositorio relacionado

Este laboratorio forma parte del trabajo práctico desarrollado junto con:

~~~text
https://github.com/JuvenalMunozR/devsecops-linux-lab
~~~

El repositorio anterior contiene los fundamentos de Linux y operaciones que sirven como base para este laboratorio de seguridad del pipeline.

---

## Entorno utilizado

El laboratorio fue desarrollado utilizando:

- Windows.
- WSL2.
- Ubuntu.
- Visual Studio Code.
- Docker Desktop con integración WSL.
- Git.

---

## Validación inicial

Antes de comenzar el pipeline se verificó que las herramientas principales estuvieran disponibles desde el entorno WSL.

La ejecución del laboratorio se realiza desde:

~~~text
/home/juvenalmunoz/devsecops-secure-pipeline
~~~

---

## Propósito del laboratorio

El laboratorio permite integrar controles de seguridad dentro de un flujo CI/CD.

Los controles principales implementados son:

1. Análisis SAST mediante Bandit.
2. Construcción de una imagen Docker.
3. Análisis de vulnerabilidades de la imagen mediante Trivy.
4. Generación de reportes.
5. Aplicación de un security gate.
6. Ejecución automática mediante GitHub Actions.

---

## Resultado

El entorno quedó preparado para continuar con los módulos de análisis SAST, seguridad de imágenes Docker y automatización del pipeline mediante GitHub Actions.
