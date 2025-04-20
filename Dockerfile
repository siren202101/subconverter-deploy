FROM debian:bullseye-slim

# 安装 unzip curl 等依赖
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# 下载 subconverter 预编译包
RUN curl -L -o subconverter.tar.gz https://github.com/MetaCubeX/subconverter/releases/download/Alpha/subconverter_linux64.tar.gz \
 && tar -xzf subconverter.tar.gz \
 && mv subconverter_linux64 /subconverter \
 && rm subconverter.tar.gz

# 设置工作目录
WORKDIR /subconverter

# 暴露默认端口
EXPOSE 25500

# 启动命令
CMD ["./subconverter"]
