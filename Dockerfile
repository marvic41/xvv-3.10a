FROM ubuntu:20.04

# Prevent interactive prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies and set timezone
RUN apt update && apt install -y cmake g++ git tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Build project
RUN cmake -B build && cmake --build build

# Run the compiled application
CMD ["./build/mtk5586hal1"]
