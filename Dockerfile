from php:5.6.28-fpm

RUN apt-get -y update && apt-get install -y build-essential cmake zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev wget unzip
RUN wget https://github.com/opencv/opencv/archive/2.3.1.zip && unzip 2.3.1.zip && rm 2.3.1.zip && mv opencv-2.3.1 OpenCV && cd OpenCV && mkdir build && cd build && cmake -DWITH_QT=OFF -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON .. && make -j4 && make install && ldconfig
RUN wget https://github.com/mgdm/OpenCV-for-PHP/archive/master.zip && unzip master.zip && cd OpenCV-for-PHP-* && phpize && ./configure && make && make install 
RUN docker-php-ext-enable opencv
