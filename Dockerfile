FROM python:3.12-slim

WORKDIR /app

# Mise à jour des packages système pour corriger les vulnérabilités
RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN useradd -u 10001 appuser

USER 10001

EXPOSE 8080

CMD ["python", "app.py"]
```
