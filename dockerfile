# use the official pyhton image as the base image
FROM python:3.9-buster 

#set the working directory int the container
WORKDIR /app

#Copy the requirements to the working directory
COPY requirements.txt .

#Install the Required python packages
RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install boto3

#copy the application code to the working directory 
COPY . .

#set the environment varialble for the flask app
ENV FLASK_RUN_HOST=0.0.0.0

#Expose the port on which the flask app will run
EXPOSE 5000

#start the flask app  when container is run 
CMD ["flask", "run"]