FROM python:3.12-slim-bullseye as python-base

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \


# expect to have new relic available
RUN pip install newrelic==9.0.0
ENV PYTHONUNBUFFERED=1


FROM python-base

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./app /app/app