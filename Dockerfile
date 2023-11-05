FROM centos:7

RUN yum -y install yum-priorities

RUN yum install -y createrepo

RUN repotrack -p /server_repo/packages httpd
RUN createrepo /server_repo/packages


COPY custom.repo /etc/yum.repos.d/custom.repo
RUN yum -y install httpd
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY local.repo /server_repo
COPY index.html /server_repo


EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


