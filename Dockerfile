FROM python:2.7
MAINTAINER Dale Stirling "dale@aurynpark.com.au"
COPY . /app
WORKDIR /app
EXPOSE 5000
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["./app/app.py"]
