Sample2Gene
===========
_Sarah Kurtis_

_Kimball/Braun Lab | Department of Biology | University of Florida_

_876 Newell Dr, Gainesville, FL 32611_

_[sarahkurtis@ufl.edu](mailto:sarahkurtis@ufl.edu)_

_September 19, 2019_
## Description
This script converts the output haplotype or genotype per-sample FASTA files of all loci into per-gene FASTA files of all samples. This script runs best on files constructed from __[Read2Fast](https://github.com/skurtis/Read2Fast)__.
```
./sample2gene.sh List Input Output
```
Below is a description of the input parameters in order in which they must be entered.

__Parameter__ | __Description__
------------- | ---------------
__List__ | Text file of all samples of which to create gene FASTA files with one sample per line. 
__Input__ | __hap__ for sample haplotype FASTA files to be used as input or __gen__ for sample consensus genotype FASTA files to be used as input.
__Output__ | Name of a directory to be created and to which gene FASTA file outputs will be sent. 

Example:
```
./sample2gene.sh sample_prefixes.txt gen gene_FASTAs  
```
