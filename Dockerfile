FROM nginx:1.9.15

RUN apt-get update && \
      apt-get install -y -qq unzip

ADD https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_linux_amd64.zip /usr/bin/

RUN unzip /usr/bin/consul-template_0.13.0_linux_amd64.zip -d /usr/local/bin

ADD nginx.conf /etc/nginx/nginx.conf

ADD default.ctmpl /templates/default.ctmpl

ADD start.sh /bin/start.sh

RUN chmod +x /bin/start.sh

ENTRYPOINT ["/bin/start.sh"]
