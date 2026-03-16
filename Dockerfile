mkdir -p ~/glm-ocr
cd ~/glm-ocr
cat > Dockerfile.vllm-cpu << 'EOF'
FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    torch==2.6.0+cpu \
    --index-url https://download.pytorch.org/whl/cpu

RUN pip install --no-cache-dir vllm

ENTRYPOINT ["python", "-m", "vllm.entrypoints.openai.api_server"]
EOF