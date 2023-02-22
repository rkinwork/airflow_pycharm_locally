# Prepare Airflow and PyCharm for local development for Data Engeneer #

Hi! I am a data engineer, working with Airflow2 and use PyCharm every day.
I want to share with you my development environment. 

## Preparation
You need to have:
* installed PyCharm
* installed Docker
* Some knowledge how to work with `Dockerfile` and `docker-compose.yaml`

## Why?
* I need possibility to run airflow locally to test pipelines
* I need possibility to run tests. 
* I want to have actual prompts from PyCharm and environment should be the same as in the production 

## What I have done
I have taken `docker-compose` file from Airflow [documentation](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html)
And updated it to use local Dockerfile to build image
In `Dockerfile` I added what I want to install beside default packages

## Prepare PyCharm
* run in terminal `make dev_image` 
* In Preferences -> Project -> Interpreter add `airflow-pycharm:latest` Docker image as remote interpreter

Now you can run test locally and have code completion 

## Working with Compose
`make start_dev` - to start Airflow locally
`stop_dev` - to stop Airflow running locally
`rebuilt_dev` - if you have made some changes in Dockerfile or requirements.txt run this command before start airflow locally

You feel free to add you services to compose file. For example I have minio service to test tasks which interacts with AWS S3 