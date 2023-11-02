FROM centos:7


RUN yum -y install yum-priorities

RUN yum-config-manager --add-repo http://172.17.0.1:8899/custom.repo
COPY --from=apache-server /local/packages /local/packages
COPY val.sh /
RUN chmod +x /val.sh

RUN yum -y clean all

RUN yum -y install httpd 

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
