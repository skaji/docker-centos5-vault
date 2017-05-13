FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/

RUN yum install -y gcc make tar wget

RUN wget -q http://www.cpan.org/authors/id/X/XS/XSAWYERX/perl-5.26.0-RC1.tar.gz
RUN tar xzf perl-5.26.0-RC1.tar.gz

RUN gcc --version
RUN make --version

RUN cd perl-5.26.0-RC1 && ./Configure -des && make
