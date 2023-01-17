FROM python:3.11

COPY . /app

WORKDIR /app

RUN pip install pipenv
RUN pipenv install --system --ignore-pipfile

CMD ["python", "-m", "flask", "--app", "microservice_1.py", "--debug", "run", "--host=0.0.0.0", "--port=5000"]