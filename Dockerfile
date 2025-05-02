FROM python:3.11-slim

WORKDIR /app

# Copy and install modern requirements
COPY requirements.txt .

# Force uninstall old versions before installing new ones
RUN pip uninstall -y Flask Jinja2 || true && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "hello.py"]
