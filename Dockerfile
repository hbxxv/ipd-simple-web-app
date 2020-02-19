# Instructions copied from - https://hub.docker.com/_/python/
FROM ubuntu

WORKDIR /usr/src/app

RUN apt update
RUN apt install python3  python3-pip -y

RUN pip3 install flask
RUN pip3 install flask-mysql
RUN pip3 install --no-cache-dir -r requirements.txt

# tell the port number the container should expose
EXPOSE 5000

COPY . .

# run the command
CMD ["python", "./app.py"]
