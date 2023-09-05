FROM amazonlinux:2023 as python-base

RUN dnf update

# # python 3.9
# RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
# RUN rm -f get-pip.py
# RUN dnf -y install gcc libpq-devel python3-devel

# python 3.11
RUN dnf -y install python3.11
RUN dnf -y install gcc libpq-devel python3.11-devel
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN rm -f get-pip.py

# expect to have new relic available
RUN pip install newrelic==9.0.0
ENV PYTHONUNBUFFERED=1


FROM python-base

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# COPY ./app /app/app