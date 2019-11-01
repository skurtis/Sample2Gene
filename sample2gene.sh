#!/bin/bash

List=$1
Input=$2
Output=$3

rm Gene_*.fasta 2>/dev/null

if [[ $Input = "hap" ]]; then

for i in $(cat $List)
do
grep -E ">" ${i}_hap1.fasta > seqnames.txt
# Output all sequence names

for j in $(cat seqnames.txt)
do
geneNo="$(echo $j | sed s/\>${i}_hap1_//g)"
# Isolate the gene name
geneline="$(grep -En "$geneNo" ${i}_hap1.fasta | cut -d":" -f1)"
head -n $(( $geneline + 1 )) ${i}_hap1.fasta | tail -n2 >> Gene_${geneNo}.fasta
head -n $(( $geneline + 1 )) ${i}_hap2.fasta | tail -n2 >> Gene_${geneNo}.fasta
# Outout the FASTA corresponding with that gene.

done
done

elif [[ $Input = "gen" ]]; then

for i in $(cat $List)
do
grep -E ">" ${i}_consensus.fasta > seqnames.txt
# Output all sequence names

for j in $(cat seqnames.txt)
do
geneNo="$(echo $j | sed s/\>${i}_//g)"
# Isolate the gene name
geneline="$(grep -En "$geneNo" ${i}_consensus.fasta | cut -d":" -f1)"
head -n $(( $geneline + 1 )) ${i}_consensus.fasta | tail -n2 >> Gene_${geneNo}.fasta
# Outout the FASTA corresponding with that gene.

done
done

fi

rm seqnames.txt

mkdir $Output
mv Gene_*.fasta $Output
# Move all gene FASTAs to a separate directory
