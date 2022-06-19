FROM python:3.10

WORKDIR /app

ENV POETRY_VERSION=1.1.13
RUN pip install "poetry==$POETRY_VERSION"
ENV PATH="${PATH}:/root/.poetry/bin"

# Add source file
COPY . /app

RUN /app
RUN poetry install && poetry check

CMD ["python", "./main.py"]
