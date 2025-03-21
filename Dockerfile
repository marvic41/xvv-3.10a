FROM ubuntu:20.04

# Install dependencies
RUN apt update && apt install -y cmake g++ git

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Build project
RUN cmake -B build && cmake --build build

CMD ["./build/my-cpp-app"]
