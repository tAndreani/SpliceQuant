#This script is usefull if you want to extract a bed file of each isoform expressed and the isoform length from the .miso_summary file
#Input *.miso_summary files
#Output a file with GeneId TrId PSI value

#run it like: bash ./Parsing_Isoform_Estimation_from_miso.sh


#!/bin/bash
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_entero_rep1.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_entero_rep1.isoforms.miso_summary > adult_entero_rep1.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep1.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep1.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep1.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep1.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_entero_rep1_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_entero_rep1_isoform_expression.bed > adult_entero_rep1_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_entero_rep1_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_entero_rep1_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_entero_rep1_isoform_expression.bed


awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_entero_rep2.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_entero_rep2.isoforms.miso_summary > adult_entero_rep2.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep2.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep2.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep2.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep2.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_entero_rep2_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_entero_rep2_isoform_expression.bed > adult_entero_rep2_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_entero_rep2_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_entero_rep2_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_entero_rep2_isoform_expression.bed


awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_entero_rep3.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_entero_rep3.isoforms.miso_summary > adult_entero_rep3.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep3.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep3.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep3.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_entero_rep3.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_entero_rep3_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_entero_rep3_isoform_expression.bed > adult_entero_rep3_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_entero_rep3_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_entero_rep3_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_entero_rep3_isoform_expression.bed


awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_stem_cells_rep1.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_stem_cells_rep1.isoforms.miso_summary > adult_stem_cells_rep1.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep1.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep1.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep1.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep1.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_stem_cells_rep1_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_stem_cells_rep1_isoform_expression.bed > adult_stem_cells_rep1_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_stem_cells_rep1_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_stem_cells_rep1_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_stem_cells_rep1_isoform_expression.bed

awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_stem_cells_rep2.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_stem_cells_rep2.isoforms.miso_summary > adult_stem_cells_rep2.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep2.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep2.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep2.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep2.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_stem_cells_rep2_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_stem_cells_rep2_isoform_expression.bed > adult_stem_cells_rep2_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_stem_cells_rep2_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_stem_cells_rep2_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_stem_cells_rep2_isoform_expression.bed

awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/adult_stem_cells_rep3.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/adult_stem_cells_rep3.isoforms.miso_summary > adult_stem_cells_rep3.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep3.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep3.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep3.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' adult_stem_cells_rep3.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  adult_stem_cells_rep3_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' adult_stem_cells_rep3_isoform_expression.bed > adult_stem_cells_rep3_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - adult_stem_cells_rep3_isoform_expression.csv >  /tmp/out && mv /tmp/out adult_stem_cells_rep3_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript adult_stem_cells_rep3_isoform_expression.bed




awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/embrio_rep1.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/embrio_rep1.isoforms.miso_summary > embrio_rep1.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' embrio_rep1.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' embrio_rep1.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' embrio_rep1.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' embrio_rep1.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  embrio_rep1_isoform_expression.bed
awk '{print $0, "\t" ($5 - $4) }' embrio_rep1_isoform_expression.bed > embrio_rep1_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - embrio_rep1_isoform_expression.csv >  /tmp/out && mv /tmp/out embrio_rep1_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript embrio_rep1_isoform_expression.bed

awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/embrio_rep2.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/embrio_rep2.isoforms.miso_summary > embrio_rep2.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' embrio_rep2.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' embrio_rep2.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' embrio_rep2.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' embrio_rep2.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  embrio_rep2_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' embrio_rep2_isoform_expression.bed > embrio_rep2_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - embrio_rep2_isoform_expression.csv >  /tmp/out && mv /tmp/out embrio_rep2_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript embrio_rep2_isoform_expression.bed



awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/embrio_rep3.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/embrio_rep3.isoforms.miso_summary > embrio_rep3.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' embrio_rep3.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' embrio_rep3.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' embrio_rep3.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' embrio_rep3.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  embrio_rep3_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' embrio_rep3_isoform_expression.bed > embrio_rep3_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - embrio_rep3_isoform_expression.csv >  /tmp/out && mv /tmp/out embrio_rep3_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript embrio_rep3_isoform_expression.bed



awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/paneth_cells_rep1.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/paneth_cells_rep1.isoforms.miso_summary > paneth_cells_rep1.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep1.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep1.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep1.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep1.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  paneth_cells_rep1_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' paneth_cells_rep1_isoform_expression.bed > paneth_cells_rep1_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - paneth_cells_rep1_isoform_expression.csv >  /tmp/out && mv /tmp/out paneth_cells_rep1_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript paneth_cells_rep1_isoform_expression.bed



awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/paneth_cells_rep2.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/paneth_cells_rep2.isoforms.miso_summary > paneth_cells_rep2.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep2.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep2.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep2.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep2.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  paneth_cells_rep2_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' paneth_cells_rep2_isoform_expression.bed > paneth_cells_rep2_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - paneth_cells_rep2_isoform_expression.csv >  /tmp/out && mv /tmp/out paneth_cells_rep2_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript paneth_cells_rep2_isoform_expression.bed


awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' */summary/paneth_cells_rep3.isoforms.miso_summary > gene_psi.txt
awk -F ' ' '{print $1}' gene_psi.txt > genes
sort genes | uniq -cd | awk -F ' ' '{print $2}' > genes_with_at_least_two_isoforms.txt
grep -Ff genes_with_at_least_two_isoforms.txt */summary/paneth_cells_rep3.isoforms.miso_summary > paneth_cells_rep3.isoforms.two_isoforms.miso_summary
awk '{ split($2,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep3.isoforms.two_isoforms.miso_summary > gene_psi_two_isoforms.txt
awk '{ split($5,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep3.isoforms.two_isoforms.miso_summary > gene_transcript.txt
awk '{ split($10,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep3.isoforms.two_isoforms.miso_summary > gene_start.txt
awk '{ split($11,a,","); for (i in a) print $1, a[i]; }' paneth_cells_rep3.isoforms.two_isoforms.miso_summary > gene_end.txt
awk -F ' ' '{print $1}' gene_psi_two_isoforms.txt > genes_two_isoforms
awk -F ' ' '{print $2}' gene_transcript.txt > transcript
awk -F ' ' '{print $2}' gene_psi_two_isoforms.txt > psi
awk -F ' ' '{print $2}' gene_start.txt > start
awk -F ' ' '{print $2}' gene_end.txt > end
awk -F '.' '{print $1}' transcript > isoforms
sed -e s/\'//g isoforms > isoforms_correct
paste genes_two_isoforms isoforms_correct psi start end >  paneth_cells_rep3_isoform_expression.bed

awk '{print $0, "\t" ($5 - $4) }' paneth_cells_rep3_isoform_expression.bed > paneth_cells_rep3_isoform_expression.csv
echo -e "GeneID\tTrID\tPSI\tStart\tEnd\tLength" | cat - paneth_cells_rep3_isoform_expression.csv >  /tmp/out && mv /tmp/out paneth_cells_rep3_isoform_expression.csv
rm *.txt *.miso_summary end genes genes_two_isoforms isoforms isoforms_correct psi start transcript paneth_cells_rep3_isoform_expression.bed


#Extract for each sample only Gene Id, Isoforms and PSI value
for i in *.csv; do cut -f 1-3 $i > $i.txt ; done 



