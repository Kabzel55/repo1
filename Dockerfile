FROM ubuntu:latest
LABEL maintainer="patryk.koryga@pollub.edu.pl"
LABEL description="Przykladowy Dockerfile dla serwera Apache & PHP."
ENV PHPVERSION=7

RUN apt install apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \
        rm -rf /var/cache/apt-get/* && \
        rm -rf /var/www/localhost/htdocs/index.html && \
        echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && \
        chmod 755 /var/www/localhost/htdocs/index.php
EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]
