FROM openjdk:11

WORKDIR /app

COPY helloworld.java .

RUN javac helloworld.java

CMD ["java", "helloworld"]
