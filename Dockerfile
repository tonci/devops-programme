FROM ubuntu:22.04

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y python3-pip

RUN pip3 install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 5000

CMD [ "python3", "./app.py" ]