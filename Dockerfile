FROM python:3.10-slim

# Creates the directory for us
WORKDIR /cubarimoe
COPY ./requirements.txt .

# Install git
RUN apt-get update && apt-get install -y git

# Install python packages
RUN python3 -m pip install --upgrade pip

# Installs these two here instead of in requirements.txt to avoid issues
RUN pip install psycopg2-binary
RUN python3 -m pip install --upgrade Pillow

RUN pip install -r requirements.txt

# Bring all the source code over
COPY . .

# Change secret key value
RUN sed -i "s|\"o kawaii koto\"|\"$(openssl rand -base64 32)\"|" cubarimoe/settings/base.py

# Will crash, that's ok
RUN python3 init.py; exit 0
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]