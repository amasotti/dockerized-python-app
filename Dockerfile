FROM python:3.10
LABEL version="0.1.0"

# Install Poetry
ENV POETRY_HOME="/.poetry"
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
ENV PATH="$POETRY_HOME/bin:$PATH"

# Copy lock files
COPY ./poetry.lock ./pyproject.toml ./

# Go to the workinig directory and copy all files not excluded by .dockerignore
WORKDIR /app
COPY . .

# Install dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev &&  \
    poetry check

# Run App
CMD ["python", "main.py"]