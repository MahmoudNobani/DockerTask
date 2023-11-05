FROM centos:7

RUN yum-config-manager --add-repo http://172.17.0.1:8899/local.repo
COPY val.sh /
RUN chmod +x /val.sh

RUN yum -y clean all
RUN yum -y install httpd -v

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
