FROM ubuntu
RUN mkdir /config
COPY *.yaml /config/
COPY ./certificates/*.pem /config/
CMD ["/bin/bash","-c","ls","/config/*"]


