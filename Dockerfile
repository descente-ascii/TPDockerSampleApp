FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -fy openjdk-8-jdk maven libpng16-16 libjasper1 libdc1394-22 git
RUN git clone https://github.com/barais/TPDockerSampleApp
WORKDIR TPDockerSampleApp
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package
CMD java -Djava.library.path=lib/ -jar target/fatjar-0.0.1-SNAPSHOT.jar
