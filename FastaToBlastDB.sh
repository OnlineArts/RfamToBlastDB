#/bin/bash

if [[ -n "$1" ]]; then
  file=$1
else
  file="rfam.fa"
fi

echo "Check for duplicated identifiers"
dups=`cat $file | grep '^>' | sort | uniq -d`
counts=`echo "$dups" | wc -l`

if (( $counts > "0" )); then
  echo "Found $counts multiple fasta sequence identifier. Please remove them before proceed:";
  echo "";
  echo "$dups";
  echo "";
  echo "Please remove this duplicated entries";
  exit 1;
fi

echo "Create BlastDB RFam$version"
makeblastdb -dbtype nucl -in rfam.fa -parse_seqids -out RFam

exit 0;
