# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install pip requirements
ADD requirements.txt .
# RUN python -m venv .venv
# RUN source .venv/bin/activate
RUN python -m pip install -r requirements.txt

WORKDIR /app
ADD . /app
EXPOSE 5000
ENV FLASK_APP=hello_app.webapp
ENV FLASK_RUN_HOST=0.0.0.0
# ENV FLASK_ENV=development flask run
# COPY . .


# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN useradd appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "hello_app.webapp:app"]
CMD ["flask", "run"]
