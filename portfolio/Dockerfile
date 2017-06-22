FROM rocker/verse:3.4.0
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
software-properties-common

# pick a flavor for jessie http://ppa.launchpad.net/cpick/hub/ubuntu/dists/
RUN echo "deb http://ppa.launchpad.net/cpick/hub/ubuntu xenial main" >> /etc/apt/sources.list \
&& add-apt-repository ppa:cpick/hub \
&& apt-get update \
&& apt-get install -y --no-install-recommends \
hub

RUN . etc/environment \
&& r -e 'devtools::install_github("rstudio/bookdown")' \
&& r -e 'warnings()'

RUN . etc/environment \
&& install2.r --repos $MRAN --deps TRUE \
	stargazer \
&& r -e 'warnings()'

# add hub from https://hub.github.com

#RUN add-apt-repository ppa:cpick/hub \
#&& apt-get update \
#&& apt-get install -y --no-install-recommends \
#hub

#RUN cd ~ && git clone https://github.com/github/hub.git \
#&& cd hub && script/build -o ~/bin/hub \
#&& alias git=hub && git version

CMD ["/init"]

