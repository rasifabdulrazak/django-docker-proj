FROM python:3.10-slim-buster

LABEL maintainer="rasifrazak123@gmail.com"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /tmp/requirements.txt

COPY ./app /app

WORKDIR /app

RUN apt-get update
# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        python3-dev \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip
RUN pip install psycopg2-binary
RUN pip install -r /tmp/requirements.txt


ENV PATH="/py/bin:$PATH"