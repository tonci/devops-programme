FROM ubuntu:22.04

RUN useradd -m appuser

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3-pip

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY app/ .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

CMD [ "python3", "./app.py" ]