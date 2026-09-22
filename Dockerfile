# Imagen base ligera
FROM python:3.12-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Crear usuario no root
RUN useradd -m appuser

# Directorio de trabajo
WORKDIR /app

# Copiar aplicación
COPY app/ /app

# Instalar dependencias
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Cambiar permisos
RUN chown -R appuser:appuser /app

# Cambiar a usuario restringido
USER appuser

# Exponer puerto
EXPOSE 5000

# Comando de inicio
CMD ["python", "app.py"]

