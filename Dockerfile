FROM minio/mc AS s3copy
RUN cp ${MINIO_HOST}:7001/${BUCKET}/* ./photos

FROM ubuntu:xenial AS build

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y install git imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python-numpy

RUN git clone https://github.com/brok3nstrings/fgallery-slideshow.git
WORKDIR /fgallery-slideshow
COPY --from=s3copy ./photos ./photos

RUN wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip
RUN unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect
RUN chmod +x /usr/bin/facedetect
RUN chmod +x fgallery

RUN ./fgallery photos/ html/

FROM nginx:stable-alpine AS final
COPY --from=build /fgallery-slideshow/html /usr/share/nginx/html
