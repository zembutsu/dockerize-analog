# dockerize-analog
"Analog is a program which analyses logfiles from WWW servers." 

# Usage

```
$ docker run \
    -v /var/log/apache2/:/var/log/apache2/ \
    -v /var/www/html/analog/:/var/www/html/analog/ \
    -v /opt/analog/data/:/opt/analog/data/ \
    analog
```
