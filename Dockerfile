FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/

RUN yum install -y gcc make tar wget

RUN wget -q http://www.cpan.org/authors/id/X/XS/XSAWYERX/perl-5.26.0-RC2.tar.gz
RUN tar xzf perl-5.26.0-RC2.tar.gz

# NOTE: If you want to work on the perl source code, do these.
# RUN rpm -ivh http://archives.fedoraproject.org/pub/archive/epel/5/x86_64/epel-release-5-4.noarch.rpm
# RUN yum install -y git
# RUN git clone git://perl5.git.perl.org/perl.git

RUN gcc  --version

RUN cd perl-5.26.0-RC2 && ./Configure -de && make
