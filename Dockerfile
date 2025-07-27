FROM registry.access.redhat.com/ubi8/ubi

USER root

RUN yum -y update && \
    yum -y install java-11-openjdk wget git curl && \
    wget -O /tmp/jenkins.rpm https://get.jenkins.io/redhat-stable/jenkins-2.440.1-1.1.noarch.rpm && \
    yum -y localinstall /tmp/jenkins.rpm --nogpgcheck && \
    yum clean all

EXPOSE 8080

CMD ["/usr/bin/jenkins"]
