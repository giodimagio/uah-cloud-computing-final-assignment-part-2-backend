FROM python:3.8
WORKDIR /app
COPY Pipfile* ./
RUN pip install pipenv && pipenv install --system --ignore-pipfile
COPY . .
CMD ["python","app.py"]