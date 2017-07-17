FROM rocker/shiny
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

RUN apt-get update \
&& apt-get upgrade -y openssl \
&& apt-get install -y --no-install-recommends \
git-core curl \
&& git config --global user.name "Oski Bear" \
&& git config --global user.email oski@rdada.berkeley.edu

RUN Rscript -e 'install.packages(c("miniUI","wordcloud2","data.table","magrittr"))'

RUN cd /srv/ && rm -rf shiny-server \
&& git clone https://github.com/w201rdada/shinyapps shiny-server \
&& ls -a /srv/shiny-server/

RUN curl https://getcaddy.com | bash \
&& echo "mercury.dlab.berkeley.edu" >> /etc/Caddyfile \
&& echo "tls brooksambrose@berkeley.edu" >> /etc/Caddyfile \
#&& echo "tls self_signed" >> /etc/Caddyfile \
&& echo "proxy / http://0.0.0.0:3838" >> /etc/Caddyfile \
&& echo '#!/bin/bash' >> /usr/bin/runcaddy.sh \
&& echo "cd /srv/shiny-server/ && caddy -agree -log ~ -conf /etc/Caddyfile" >> /usr/bin/runcaddy.sh \
&& echo '#!/bin/bash' >> /usr/bin/start.sh \
&& echo "/usr/bin/shiny-server.sh & /usr/bin/runcaddy.sh" >> /usr/bin/start.sh \
&& chmod u+x /usr/bin/runcaddy.sh

RUN cd /srv/ && rm -rf shiny-server \
&& git clone https://github.com/w201rdada/shinyapps shiny-server \
&& ls -a /srv/shiny-server/

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv/shiny-server/

ENTRYPOINT ["bash"]
CMD ["/usr/bin/start.sh"]
