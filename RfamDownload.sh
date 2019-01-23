#!/bin/bash

version="14.0"
start=00001
end=02889

echo "Rfam version: $version"
echo "Start downloading"

echo '' > rfam.fa
for i in {00001..02889}; do
  echo "$i / 02889"
  wget ftp://ftp.ebi.ac.uk/pub/databases/Rfam/$version/fasta_files/RF$i.fa.gz -O RF$i.fa.gz > /dev/null 2>&1
  if (( "$?" != 0)); then
    continue;
  fi
  gunzip RF$i.fa.gz
  cat RF$i.fa >> rfam.fa 2> /dev/null
  rm RF$i.fa
done

echo "Clean up not used files"
rm RF*.fa* 2> /dev/null
echo "Finished"

exit 0;
