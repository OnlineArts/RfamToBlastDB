# RfamToBlastDB
This tool will download the newest  [**Rfam 14.0 database**](http://rfam.xfam.org/) as a concatenated fasta file.
Afterswards it can be used for building a [**Blast database**](https://blast.ncbi.nlm.nih.gov/Blast.cgi).

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
