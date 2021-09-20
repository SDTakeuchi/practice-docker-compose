FROM python:3.9.7-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

WORKDIR /django

ADD requirements.txt .

RUN pip install -r requirements.txt

COPY ./config ./config

EXPOSE 8000

# CMD ["python", "./config/manage.py", "runserver", "0.0.0.0:8000"]