FROM scratch
MAINTAINER Stephane Jourdan <stephane.jourdan@squarescale.com>
COPY ./server /server
ENTRYPOINT ["/server"]
