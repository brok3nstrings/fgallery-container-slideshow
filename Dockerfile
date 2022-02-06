FROM ubuntu:bionic AS build

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y install imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python-numpy

COPY ./fgallery-LATEST.zip .
RUN unzip fgallery-LATEST.zip
WORKDIR /fgallery
COPY ./photos2 ./photos2

RUN wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip
RUN unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect
RUN chmod +x /usr/bin/facedetect
RUN chmod +x /fgallery/fgallery

RUN ./fgallery photos2/ html/

FROM nginx:stable-alpine AS final
COPY --from=build /fgallery/html /usr/share/nginx/html