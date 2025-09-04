FROM mcr.microsoft.com/devcontainers/python:1-3.10-bullseye

COPY ./python.requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt