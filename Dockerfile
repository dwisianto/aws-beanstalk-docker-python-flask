FROM python:3.5-alpine

RUN mkdir -p /usr/src/my_app/
COPY src/main/w3/requirements.txt /usr/src/my_app/

WORKDIR /usr/src/my_app/
RUN pip install -r requirements.txt

COPY . /usr/src/my_app

ENTRYPOINT ["python", "src/main/w3/app.py"]
EXPOSE 5000
