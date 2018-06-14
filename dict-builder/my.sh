#!/bin/bash

#echo hello

cd /mecab-ko-dic-2.0.3-20170922

rm *.csv user-dic/*.csv

cp /var/lib/mecab/nng.csv user-dic
cp /var/lib/mecab/compound.csv user-dic
cp /var/lib/mecab/XSN.csv .
cp /var/lib/mecab/XPN.csv .

tools/add-userdic.sh

sed -i 's/Compound/Preanalysis/g' user-compound.csv

make clean; make


#echo hello > /var/lib/mecab/output/output.txt

cp unk.dic sys.dic user-nng.csv user-compound.csv /var/lib/mecab

