FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

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

WORKDIR /opt

COPY opt /opt

RUN chmod +x /opt/paserver || true

EXPOSE 64211 8077 8080 8082

CMD ["/bin/bash", "-c", "/opt/paserver -password=$PA_SERVER_PASSWORD -port=64211"]
