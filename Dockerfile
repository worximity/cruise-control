FROM anapsix/alpine-java:8u131b11_jdk

RUN mkdir -p /project/wx-cruise-control
WORKDIR /project/wx-cruise-control
COPY . /project/wx-cruise-control

EXPOSE 9090
ENTRYPOINT [ "/project/wx-cruise-control/kafka-cruise-control-start.sh" ]
CMD ["config/dev.properties"]