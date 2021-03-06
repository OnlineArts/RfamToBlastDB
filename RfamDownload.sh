#!/bin/bash

version="14.0"
start=000001
end=002889

echo "Rfam version: $version"
echo "Start downloading"

echo '' > rfam.fa
t=$(echo $end | sed 's/^0*//')
for i in `seq -w $start $end`; do
  ii=$(echo $i | sed 's/^0*//')
  p=`awk "BEGIN{print int(($ii/$t)*100)}"`
  echo -ne "\r\e[42m${p} %\033[0m\t($i:$end)"
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
