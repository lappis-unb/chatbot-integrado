# Use a imagem base do Botpress
FROM botpress/server:v12_26_7

# Defina o diretório de trabalho
WORKDIR /botpress

# Crie o diretório NLU e baixe os arquivos necessários para ele
RUN mkdir -p /botpress/NLU && \
    apt-get update && apt-get install -y wget && \
    wget --progress=bar -P /botpress/NLU http://botpress-public.nyc3.digitaloceanspaces.com/embeddings/bp.pt.bpe.model && \
    wget --progress=bar -P /botpress/NLU http://botpress-public.nyc3.digitaloceanspaces.com/embeddings/bp.pt.100.bin && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Exponha as portas necessárias
EXPOSE 3100


# Comando para iniciar o Botpress com Duckling e o serviço de linguagem
CMD ["./bp", "lang", "--offline", "--dim", "100", "--langDir", "/botpress/NLU"]
