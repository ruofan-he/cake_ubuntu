FROM ubuntu:18.04 AS basic
LABEL ruofan he

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    
RUN mkdir /mount

WORKDIR /mount

VOLUME /mount

CMD ["/bin/bash"]

