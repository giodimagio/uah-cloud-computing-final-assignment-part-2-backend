FROM python:3.11

COPY . /app

WORKDIR /app

RUN pip install pipenv
RUN pipenv install --system --ignore-pipfile

CMD ["python", "-Bm", "flask", "--app", "microservice_1.py", "--debug", "run", "--host=localhost", "--port=5000"]