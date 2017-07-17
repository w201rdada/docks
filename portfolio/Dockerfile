FROM rocker/verse:3.4.0
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
software-properties-common

# add hub from https://hub.github.com
RUN cd ~ && wget https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz \
&& tar -zxvf hub-linux-amd64-2.2.9.tgz \
&& ./hub-linux-amd64-2.2.9/install \
&& rm -rf hub* \
&& hub version

RUN . etc/environment \
&& r -e 'devtools::install_github("rstudio/bookdown")' \
&& r -e 'warnings()'

RUN . etc/environment \
&& install2.r --repos $MRAN --deps TRUE \
	stargazer \
&& r -e 'warnings()'

CMD ["/init"]

