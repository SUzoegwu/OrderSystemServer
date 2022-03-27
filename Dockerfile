# Pulling python image 3.9
FROM python:3.9-alpine

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /app

# Set environment variables
ENV PORT=5000
ENV HOST="0.0.0.0"

ENV MENU="{\"breakfast\":{\"1\":\"Eggs\",\"2\":\"Toast\",\"3\":\"Coffee\"},\"lunch\":{\"1\":\"Sandwich\",\"2\":\"Chips\",\"3\":\"Soda\"},\"dinner\":{\"1\":\"Steak\",\"2\":\"Potatoes\",\"3\":\"Wine\",\"4\":\"Cake\"}}"

ENV COMPLIMENTARY="{\"breakfast\":{\"main\":\"\", \"side\":\"\", \"drink\":\"\"},\"lunch\":{\"main\":\"\", \"side\":\"\", \"drink\":\"\"},\"dinner\":{\"main\":\"\", \"side\":\"\", \"drink\":\"Water\", \"dessert\":\"\"}}"

ENV SINGLE_ITEM="{\"breakfast\":[\"1\",\"2\"],\"lunch\":[\"1\", \"3\"],\"dinner\":[\"1\", \"2\", \"3\"]}"

ENV COURSE_CATEGORY_MAPPING="{\"main\":\"1\",\"side\":\"2\",\"drink\":\"3\",\"dessert\":\"4\",\"appetizers\":\"5\"}"

ENV MANDATORY_COURSE="{\"breakfast\":[\"main\",\"side\"],\"lunch\":[\"main\",\"side\"],\"dinner\":[\"main\",\"side\",\"dessert\"]}"

ENV FLASK_ENV=development

ENV LOG_LEVEL="INFO"

RUN pytest ./tests/order_tests.py

ENTRYPOINT ["python","./app.py"]