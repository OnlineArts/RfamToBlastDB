# RfamToBlastDB
This tool will download the newest  RFam 14.0 database as concatenated fasta file.
Afterswards it can be used for building a **blast database**.

Just run:
```bash
./RfamDownload.sh
./FastaToBlastDB.sh
```
## Required packages:
* bash
* wget
* grep
* cat
* sort
* uniq
* ncbi-blast+
