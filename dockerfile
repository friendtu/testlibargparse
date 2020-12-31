FROM ubuntu:18.04 as builder

RUN set -ex;			\
    apt-get update;		\
    apt-get install -y cmake git g++;	\
    mkdir -p /usr/src;		\
    cd /usr/src;		\
    git clone https://github.com/kmurray/libargparse;	\
    mkdir -p /usr/src/libargparse/build;			\
    mkdir -p /usr/src/testlibargparse/build;			\
    cd /usr/src/libargparse/build;	\
    cmake ..;make; 			\
    cp /usr/src/libargparse/src/*.hpp /usr/local/include;	\
    cp /usr/src/libargparse/src/*.tpp /usr/local/include;	\
    cp /usr/src/libargparse/build/*.a /usr/local/lib


COPY . /usr/src/testlibargparse

RUN set -ex;	\
    cd /usr/src/testlibargparse/build;	   \
    cmake ..; make; make test; make install

CMD ["add"]

FROM ubuntu:18.04 as runtime
RUN set -ex; 		\
    apt-get update
COPY --from=builder /usr/local/bin /usr/local/bin
CMD ["add"]




    
        

    
