cat > docs/02-trivy-manual.md <<'EOF'
# Módulo 2 — Trivy: análisis manual de vulnerabilidades

## Objetivo

Realizar un análisis manual de vulnerabilidades sobre la imagen Docker de la aplicación antes de ejecutar el análisis automatizado mediante GitHub Actions.

Este paso permite comprender el funcionamiento de Trivy y validar localmente la política de seguridad utilizada posteriormente en el pipeline.

## Contexto

Trivy se utiliza para identificar vulnerabilidades conocidas presentes en la imagen de la aplicación y sus dependencias.

En este proyecto se utiliza específicamente el scanner de vulnerabilidades:

```bash
--scanners vuln
```

## Imagen analizada

La imagen utilizada durante la validación es:

```text
devsecops-app:v2
```

Esta imagen corresponde a la aplicación Flask construida mediante el `Dockerfile` del repositorio.

## Construcción de la imagen

La imagen se construye localmente mediante:

```bash
docker build --no-cache -t devsecops-app:v2 .
```

## Escaneo manual

Para analizar las vulnerabilidades HIGH y CRITICAL:

```bash
trivy image \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  devsecops-app:v2
```

Este análisis permite identificar las vulnerabilidades presentes y determinar cuáles cuentan con una corrección disponible.

## Política de seguridad

El pipeline utiliza la siguiente política:

```bash
--severity HIGH,CRITICAL
```

Las vulnerabilidades sin corrección disponible se excluyen del gate mediante:

```bash
--ignore-unfixed
```

El comando utilizado para validar el gate localmente es:

```bash
trivy image \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --exit-code 1 \
  devsecops-app:v2
```

## Código de salida

El parámetro:

```bash
--exit-code 1
```

hace que Trivy finalice con código `1` cuando encuentra vulnerabilidades que cumplen los criterios definidos por la política.

Un código de salida `0` indica que el análisis no encontró vulnerabilidades que hagan fallar el gate bajo los criterios configurados.

## Resultado de la validación

Durante la validación local de `devsecops-app:v2` se identificaron vulnerabilidades HIGH en componentes de la imagen base.

Al utilizar:

```bash
--ignore-unfixed
```

las vulnerabilidades sin corrección disponible no provocan el fallo del gate.

La misma política fue incorporada posteriormente al workflow de GitHub Actions.

## Relación con CI/CD

El análisis manual permite validar localmente el comportamiento que posteriormente se ejecuta de forma automática en GitHub Actions.

Flujo:

Developer
    |
    v
Docker Build
    |
    v
Trivy Vulnerability Scan
    |
    v
Security Gate
    |
    +--> Pass
    |
    +--> Fail

De esta forma, el comportamiento validado localmente se integra posteriormente en el pipeline de GitHub Actions.
EOF