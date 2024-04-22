# Fase de construcción
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Fase de producción
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /app /app

COPY . .

# Exponer el puerto
EXPOSE 8000

# Establecer las variables de entorno necesarias
ENV MONGO_HOST=my_mongo_host
ENV MONGO_PORT=27017

# Ejecutar la aplicación
CMD ["python", "app.py"]
