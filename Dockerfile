FROM centos:7

RUN yum -y install yum-priorities

COPY custom.repo /etc/yum.repos.d/custom.repo
COPY /HTTPDrepo /HTTPDrepo


RUN yum -y install httpd

COPY custom.repo /var/www/html
COPY index.html /var/www/html


EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


