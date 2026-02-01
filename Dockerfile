FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependências necessárias para PAServer + UniGUI
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libfontconfig1 \
    libcurl4 \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Diretório de trabalho
WORKDIR /opt

# Runtime do UniGUI (mantém exatamente como você já tem)
COPY opt /opt

# PAServer (copiando a pasta inteira)
COPY PAServer-20.0 /opt/PAServer-20.0

# Permissão de execução
RUN chmod +x /opt/PAServer-20.0/paserver

# Porta do PAServer
EXPOSE 64211

# Inicializa o PAServer
CMD ["/bin/bash", "-c", "/opt/PAServer-20.0/paserver -password=$PA_SERVER_PASSWORD -port=64211"]
