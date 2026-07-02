# Use a imagem oficial do Python
FROM python:3.11-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o arquivo de requisitos (se existir) ou instala as dependências necessárias
COPY requirements.txt . 2>/dev/null || true

# Instala as dependências do Python
RUN pip install --no-cache-dir \
    fastapi==0.104.1 \
    uvicorn==0.24.0 \
    sqlalchemy==2.0.23 \
    mysql-connector-python==8.2.0 \
    python-dotenv==1.0.0 \
    pydantic==2.5.0 \
    pydantic-settings==2.1.0 \
    cors==1.0.1

# Copia todos os arquivos do projeto para o container
COPY . .

# Expõe a porta que a API será executada
EXPOSE 8000

# Comando para iniciar a aplicação FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
