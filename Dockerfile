FROM python:3.10
LABEL version="0.1.0"

WORKDIR /app
COPY . .

RUN pip install requests bs4
RUN pwd && ls -Alh
CMD ["python", "dockerized_python_app/main.py"]