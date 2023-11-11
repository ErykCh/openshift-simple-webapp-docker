#FROM ubuntu:20.04
#RUN apt-get update && apt-get install -y python3 python3-pip
#RUN pip install flask 
#COPY app.py /opt/
#ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080

FROM registry.access.redhat.com/ubi9/python-311:1-34

# By default, listen on port 8081
EXPOSE 8080/tcp
ENV FLASK_PORT=8080

# Set the working directory in the container
WORKDIR /projects

# Copy the content of the local src directory to the working directory
COPY . .

# Install any dependencies
RUN \
  if [ -f requirements.txt ]; \
    then pip install -r requirements.txt; \
  elif [ `ls -1q *.txt | wc -l` == 1 ]; \
    then pip install -r *.txt; \
  fi

# Specify the command to run on container start
CMD [ "python", "./app.py" ]