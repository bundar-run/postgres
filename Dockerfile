FROM postgres:17

ARG WALG_VERSION=3.0.3
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y curl \
    && BINARY_ARCH=$(if [ "$TARGETARCH" = "arm64" ]; then echo "aarch64"; else echo "amd64"; fi) \
    && curl -L https://github.com/wal-g/wal-g/releases/download/v${WALG_VERSION}/wal-g-pg-ubuntu-20.04-${BINARY_ARCH} -o /usr/local/bin/wal-g \
    && chmod +x /usr/local/bin/wal-g \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
