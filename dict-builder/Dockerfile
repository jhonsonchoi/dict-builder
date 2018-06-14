FROM centos:6

# RUN yum -y update && yum -y install nginx unzip

# RUN yum -y update && yum -y install autoconf automake

RUN yum -y update && yum -y install java-1.8.0-openjdk

#COPY mkdic-1.0.jar .

COPY mecab-ko-dic-2.0.3-20170922.tar.gz .

COPY mecab/mecab /usr/bin
COPY mecab/mecab-config /usr/bin

COPY mecab/libmecab.so.2.0.0 /usr/lib64
COPY mecab/libmecab.a /usr/lib64
COPY mecab/libmecab.la /usr/lib64
COPY mecab/libMeCab.so /usr/lib64

RUN ln -sf /usr/lib64/libmecab.so.2.0.0 /usr/lib64/libmecab.so.2 && ln -sf /usr/lib64/libmecab.so.2.0.0 /usr/lib64/libmecab.so

RUN mkdir -p /usr/lib64/mecab/dic/mecab-ko-dic && mkdir -p /usr/libexec/mecab

COPY mecab/mecab-dict-index /usr/libexec/mecab
COPY mecab/mecab-dict-gen /usr/libexec/mecab
COPY mecab/mecab-cost-train /usr/libexec/mecab
COPY mecab/mecab-system-eval /usr/libexec/mecab
COPY mecab/mecab-test-gen /usr/libexec/mecab

#COPY mecab/model.bin /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/matrix.bin /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/char.bin /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/sys.dic /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/unk.dic /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/left-id.def /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/right-id.def /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/rewrite.def /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/pos-id.def /usr/lib64/mecab/dic/mecab-ko-dic
#COPY mecab/dicrc /usr/lib64/mecab/dic/mecab-ko-dic

COPY mecab/mecabrc /etc/mecab/mecabrc

RUN tar zxf mecab-ko-dic-2.0.3-20170922.tar.gz && cd mecab-ko-dic-2.0.3-20170922 && ./configure && make

#COPY add-userdic.sh /mecab-ko-dic-2.0.3-20170922/tools
COPY my.sh /
COPY add-userdic.sh /mecab-ko-dic-2.0.3-20170922/tools

RUN mkdir /var/lib/mecab

#; chmod +x /mecab-ko-dic-2.0.3-20170922/tools/add-userdic.sh

VOLUME /var/lib/mecab
