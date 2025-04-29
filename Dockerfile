FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
COPY . .

ENV REDIS_HOST=redis://redis-htb-service
ENV REDIS_PORT=6379

RUN python -m venv .venv && \
    . .venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 5000

CMD ["sh", "-c", ". .venv/bin/activate && gunicorn -w 4 -b 0.0.0.0:5000 wsgi:app"]
