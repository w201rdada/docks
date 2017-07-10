FROM rocker/shiny
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

RUN apt-get update \
&& apt-get upgrade -y openssl \
&& apt-get install -y --no-install-recommends \
git-core \
apache2 \
&& git config --global user.name "Oski Bear" \
&& git config --global user.email oski@rdada.berkeley.edu

#RUN echo

RUN Rscript -e 'install.packages(c("miniUI","wordcloud2","data.table","magrittr"))'

#RUN echo

RUN cd /srv/ && rm -rf shiny-server \
&& git clone https://github.com/w201rdada/shinyapps shiny-server \
&& ls -a /srv/shiny-server/

#RUN echo

RUN a2enmod ssl proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html \
&& a2ensite default-ssl \
&& mkdir /etc/apache2/ssl \
&& openssl req -x509 -nodes -days 730 -newkey rsa:2048 \
-keyout /etc/apache2/ssl/rdada.key \
-out /etc/apache2/ssl/rdada.crt \
-subj '/C=US/ST=California/L=Berkeley/O=I School/OU=MIDS/CN=mercury.dlab.berkeley.edu/emailAddress=brooksambrose@berkeley.edu' \
&& chmod 600 /etc/apache2/ssl/* \
&& DSC=/etc/apache2/sites-enabled/default-ssl.conf \
&& sed -i '2s|.*|\t<VirtualHost _default_:443>|' $DSC \
&& sed -i '3s|.*|\t\tServerAdmin brooksambrose@berkeley.edu|' $DSC \
&& sed -i '4s|.*|\t\tServerName mercury.dlab.berkeley.edu:443|' $DSC \
&& sed -i '32s|.*|\t\tSSLCertificateFile /etc/apache2/ssl/rdada.crt|' $DSC \
&& sed -i '33s|.*|\t\tSSLCertificateKeyFile /etc/apache2/ssl/rdada.key|' $DSC \
&& sed -i '33s|$|\n\t\tProxyPreserveHost On\n\t\tProxyPass / http://0.0.0.0:3838/\n\t\tProxyPassReverse / http://0.0.0.0:3838/|' $DSC \
&& service apache2 start

#RUN echo
RUN sed -i '2s|.*|service apache2 start|' /usr/bin/shiny-server.sh \
&& cat /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]

