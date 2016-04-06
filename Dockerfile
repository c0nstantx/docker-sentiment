#
# Rocketgraph sentiment
#

# Pull base image.
FROM rocketgraph/python

MAINTAINER Konstantinos Christofilos <kostas.christofilos@rocketgraph.com>

# Install supervisor
RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get -y install supervisor

ADD ./supervisord.conf /etc/supervisor/supervisord.conf

#Install textblob
RUN pip install -U textblob
RUN pip install -U textblob-de
RUN pip install -U textblob-fr

RUN python -m textblob.download_corpora

#Install Flask
RUN pip install --user Flask
 
EXPOSE 9876

CMD ["supervisord", "-n"]

