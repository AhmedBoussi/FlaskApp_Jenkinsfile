#FROM python:3.7-alpine
#WORKDIR /code
#ENV FLASK_APP app.py
#ENV FLASK_RUN_HOST 0.0.0.0
#RUN apk add --no-cache gcc musl-dev linux-headers
#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#COPY . .
#CMD ["flask", "run"]

# Inherit from the Python Docker image
FROM python:3.7-slim
# Install the Flask package via pip
RUN pip install requirements.txt
# Copy the source code to app folder
COPY ./app.py /app/
# Change the working directory
WORKDIR /app/
# Set “python” as the entry point
ENTRYPOINT [“python”]
# Set the command as the script name
CMD [“app.py”]
