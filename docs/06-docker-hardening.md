# Módulo 6 — Docker Hardening

## Objetivo

Aplicar medidas básicas de hardening sobre el contenedor Docker para reducir la superficie de ataque y limitar los privilegios del proceso de aplicación.

---

## Problema identificado

El contenedor debía ejecutarse evitando privilegios innecesarios.

El principal control aplicado en esta versión es ejecutar la aplicación con un usuario no privilegiado en lugar de `root`.

---

## Medidas implementadas

### 1. Uso de imagen `slim`

El `Dockerfile` utiliza una imagen reducida de Python:

~~~dockerfile
FROM python:3.12-slim
~~~

El objetivo es utilizar una imagen base con menos componentes innecesarios.

---

### 2. Usuario no root

Se crea un usuario específico para ejecutar la aplicación:

~~~dockerfile
RUN useradd -m appuser
~~~

Posteriormente, el proceso del contenedor cambia a ese usuario:

~~~dockerfile
USER appuser
~~~

Esto evita que la aplicación se ejecute directamente como `root`.

---

### 3. Permisos de la aplicación

Se asigna la propiedad del directorio de la aplicación al usuario de ejecución:

~~~dockerfile
RUN chown -R appuser:appuser /app
~~~

De esta forma, `appuser` puede trabajar con los archivos necesarios sin requerir privilegios de `root`.

---

### 4. Dependencias definidas explícitamente

Las dependencias de Python se mantienen en `requirements.txt`:

~~~text
Flask==3.1.3
~~~

El `Dockerfile` las instala durante la construcción:

~~~dockerfile
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
~~~

Esto permite reproducir la instalación de dependencias dentro de la imagen.

---

### 5. Evitar archivos `.pyc`

Se establece:

~~~dockerfile
ENV PYTHONDONTWRITEBYTECODE=1
~~~

Esto evita que Python genere archivos `.pyc` durante la ejecución.

---

### 6. Salida de Python sin buffering

Se establece:

~~~dockerfile
ENV PYTHONUNBUFFERED=1
~~~

Esto facilita la visualización inmediata de los logs de Python en el entorno del contenedor.

---

### 7. Puerto de aplicación

La imagen declara el puerto utilizado por Flask:

~~~dockerfile
EXPOSE 5000
~~~

La aplicación utiliza:

~~~python
app.run(host="0.0.0.0", port=5000)
~~~

En este laboratorio, esta configuración permite que Flask sea accesible mediante el puerto publicado por Docker.

---

## Dockerfile V2 validado

~~~dockerfile
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
~~~

---

## Validación del usuario de ejecución

La imagen fue inspeccionada para comprobar la configuración del usuario.

Resultado validado:

~~~text
User=appuser
Entrypoint=[]
Cmd=[python app.py]
~~~

Esto confirma que el proceso principal del contenedor utiliza `appuser`.

---

## Validación funcional

La imagen fue construida mediante:

~~~bash
docker build --no-cache -t devsecops-app:v2 .
~~~

El contenedor fue ejecutado mediante:

~~~bash
docker run --rm -d \
  --name devsecops-app-v2 \
  -p 5000:5000 \
  devsecops-app:v2
~~~

La aplicación fue validada mediante:

~~~bash
curl http://localhost:5000
~~~

Resultado:

~~~text
DevSecOps App Running 🚀
~~~

---

## Relación con DevSecOps

El hardening del contenedor forma parte de los controles de seguridad aplicados antes de ejecutar y analizar la imagen.

El flujo validado en este laboratorio es:

1. Construir la imagen.
2. Ejecutar la aplicación con un usuario no privilegiado.
3. Validar el funcionamiento.
4. Analizar la imagen con Trivy.
5. Aplicar una política de seguridad mediante el security gate.
6. Ejecutar estos controles nuevamente dentro de GitHub Actions.

El objetivo no es solamente detectar vulnerabilidades, sino también reducir privilegios innecesarios durante la ejecución.

---

## Resultado

La versión V2 del contenedor quedó configurada con:

- Python 3.12 sobre `python:3.12-slim`.
- Usuario no root `appuser`.
- Dependencias definidas en `requirements.txt`.
- Permisos del directorio `/app` asignados a `appuser`.
- Variables de entorno para controlar el comportamiento de Python.
- Puerto de aplicación `5000`.
- Ejecución mediante `python app.py`.

Estas medidas fueron implementadas y verificadas en el entorno local antes de integrarse al pipeline de GitHub Actions.
