FROM centos:7

RUN yum-config-manager --add-repo http://172.17.0.2/custom.repo

RUN yum -y install yum-priorities

RUN yum -y clean all

RUN yum -y install httpd 

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
