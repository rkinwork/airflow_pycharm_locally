ARG AIRFLOW_VERSION=2.5.1-python3.10

FROM apache/airflow:${AIRFLOW_VERSION}

ARG HOME=/home/airflow

USER root
# RUN apt-get update && apt-get install -y build-essential
ADD requirements.txt /requirements.txt

USER 50000
RUN pip install --upgrade pip
RUN pip install --user -r /requirements.txt

RUN mkdir ${HOME}/src
COPY --chown=50000 . ${HOME}/src/
