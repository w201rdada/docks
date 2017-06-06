FROM rocker/verse:3.3.3
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

RUN . etc/environment \
&& r -e 'devtools::install_github("rstudio/bookdown")'
&& r -e 'warnings()'

RUN . etc/environment \
&& install2.r --repos $MRAN --deps TRUE \
	stargazer \
&& r -e 'warnings()'

CMD ["\init"]

