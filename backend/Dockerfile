FROM python:3.10-slim-buster

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && echo 'Acquire::Check-Valid-Until "0";' > /etc/apt/apt.conf.d/99no-check-valid-until

RUN pip install -U pip \
    && pip install --no-cache pipenv \
    && pip install --no-cache poetry \
    && pip install --no-cache python-dotenv

COPY poetry.lock pyproject.toml /app/

WORKDIR /app

RUN poetry config virtualenvs.create false \
    && poetry install --no-root --with dev

COPY . .

#ENV FLASK_APP=realworld.app

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

#ENTRYPOINT ["/bin/bash"]
