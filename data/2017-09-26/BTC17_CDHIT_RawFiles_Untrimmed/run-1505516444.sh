#!/bin/sh
#$ -S /bin/bash
#$ -v PATH=/home/oasis/data/webcomp/RAMMCAP-ann/bin:/usr/local/bin:/usr/bin:/bin
#$ -v BLASTMAT=/home/oasis/data/webcomp/RAMMCAP-ann/blast/bin/data
#$ -v LD_LIBRARY_PATH=/home/oasis/data/webcomp/RAMMCAP-ann/gnuplot-install/lib
#$ -v PERL5LIB=/home/hying/programs/Perl_Lib
#$ -q all.q
#$ -pe orte 2


#$ -e /home/oasis/data/webcomp/web-session/1505516444/1505516444.err
#$ -o /home/oasis/data/webcomp/web-session/1505516444/1505516444.out
cd /home/oasis/data/webcomp/web-session/1505516444
faa_stat.pl 1505516444.fas.0

/home/oasis/data/NGS-ann-project/apps/cd-hit/cd-hit-est -i 1505516444.fas.0 -d 0 -o 1505516444.fas.1 -c 1.0 -n 10 -l 11  -r 0 -G 1 -g 1 -b 20 -s 0.0 -aL 0.0 -aS 0.0 -T 4 -M 32000
faa_stat.pl 1505516444.fas.1
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_sort_by.pl no < 1505516444.fas.1.clstr > 1505516444.fas.1.clstr.sorted
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list.pl 1505516444.fas.1.clstr 1505516444.clstr.dump
gnuplot1.pl < 1505516444.fas.1.clstr > 1505516444.fas.1.clstr.1; gnuplot2.pl 1505516444.fas.1.clstr.1 1505516444.fas.1.clstr.1.png
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1505516444.clstr.dump 1505516444.clstr_no.dump
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1505516444.clstr.dump 1505516444.clstr_len.dump len
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1505516444.clstr.dump 1505516444.clstr_des.dump des
tar -zcf 1505516444.result.tar.gz * --exclude=*.dump --exclude=*.env
echo hello > 1505516444.ok
