# Utiliser une image Python officielle
FROM python:3.13-slim

# Définit le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances en premier pour profiter du cache Docker
COPY requirements.txt .

# Installer les dépendances
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY . .

# Exposer le port (documentaire)
EXPOSE 5000

# Commande de démarrage
CMD ["python", "app.py"]
