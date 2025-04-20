FROM debian:bullseye-slim

# 安装 curl 和解压工具
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# 创建目录并下载 subconverter
WORKDIR /subconverter
RUN curl -L -o subconverter.tar.gz https://github.com/MetaCubeX/subconverter/releases/download/Alpha/subconverter_linux64.tar.gz \
 && tar -xzf subconverter.tar.gz \
 && rm subconverter.tar.gz

# 开放端口（默认为 25500）
EXPOSE 25500

# 启动 subconverter
CMD ["./subconverter"]
