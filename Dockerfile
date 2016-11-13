FROM ailispaw/ubuntu-essential:14.04-nodoc

# install the latest jubatus
RUN echo "deb http://download.jubat.us/apt/ubuntu/trusty binary/" >> /etc/apt/sources.list.d/jubatus.list && \
    apt-get -q -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -q --force-yes -y install --no-install-recommends jubatus && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# set environment variables from /opt/jubatus/profile
ENV JUBATUS_HOME /opt/jubatus

ENV PATH="${JUBATUS_HOME}/bin:${PATH}" \
    LD_LIBRARY_PATH="${JUBATUS_HOME}/lib:${LD_LIBRARY_PATH}" \
    LDFLAGS="-L${JUBATUS_HOME}/lib ${LDFLAGS}" \
    CPLUS_INCLUDE_PATH="${JUBATUS_HOME}/include:${CPLUS_INCLUDE_PATH}" \
    PKG_CONFIG_PATH="${JUBATUS_HOME}/lib/pkgconfig:${PKG_CONFIG_PATH}"

EXPOSE 9199

ENTRYPOINT [ "jubaclassifier" ]
