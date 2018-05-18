# Dockerfile for tdproj/vittlercloud

FROM dgrochowicz/ionicbase

LABEL description="Ionic" \
      version="1.0" \
      maintainer="dom@dominikdev.com"

ADD install-ion-app.sh /usr/local/bin/
ADD run-ion-app.sh /usr/local/bin/
RUN bash -C '/usr/local/bin/install-ion-app.sh'
CMD bash -C '/usr/local/bin/run-ion-app.sh'

# 20-aug-16: Do NOT use VOLUME statement as it may result in numerous 
# orphaned volumes when innocent users or apps just run 
# docker run --rm ... bash
# VOLUME /projects