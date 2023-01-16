FROM python:3.12

COPY . /app

WORKDIR /app

RUN pip install pipenv
RUN pipenv install --system --ignore-pipfile

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]