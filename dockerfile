# Use a imagem base do Botpress
FROM chatbotbp/botpress_brasil_participativo:v1_0_1

# Defina o diretório de trabalho
WORKDIR /botpress

# Copie os arquivos de configuração para o contêiner
COPY ./data /botpress/data
# Defina as variáveis de ambiente
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_IP_PORT
ENV BP_PRODUCTION=true
ENV BP_HTTP_PORT=3000
ENV DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}
# ENV DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}

# Exponha as portas necessárias
EXPOSE 3000
EXPOSE 8000

# Comando para iniciar o Botpress com Duckling e o serviço de linguagem
CMD ["/bin/bash", "-c", "./duckling & ./bp"]
