FROM centos:7

RUN yum -y install yum-priorities

RUN repotrack -p /local/packages httpd
RUN yum install -y createrepo
RUN createrepo /local/packages

COPY custom.repo /etc/yum.repos.d/custom.repo
RUN yum -y install httpd

COPY custom.repo /var/www/html
COPY index.html /var/www/html


EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


