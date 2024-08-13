FROM python:3.11-slim-bookworm

RUN apt-get update \
 && apt-get install -y --no-install-recommends dexdump=11.0* \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY peepapp_analyze.py .

ENTRYPOINT ["/peepapp_analyze.py"]
CMD ["app.apk"]
