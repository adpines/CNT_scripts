#!/bin/bash
general=/data/joy/BBL/studies/grmpy/rawData/*/*/
for i in $general;do 
	bblIDs=$(echo ${i}|cut -d'/' -f8 |sed s@'/'@' '@g);
	SubDate_and_ID=$(echo ${i}|cut -d'/' -f9|sed s@'/'@' '@g|sed s@'x'@'x'@g)
	Date=$(echo ${SubDate_and_ID}|cut -d',' -f1)
	ID=$(echo ${SubDate_and_ID}|cut -d',' -f2)

out=/data/joy/BBL/projects/multishell_diffusion/processedData/multishellPipelineFall2017/${bblIDs}/${SubDate_and_ID}

folder=/data/joy/BBL/projects/multishell_diffusion/processedData/Connectivity
mv $out/tractography/FANetworkCon.csv $out/tractography/${bblIDs}_${SubDate_and_ID}_FAConNet.csv 
mv $out/tractography/NetworkCon.csv $out/tractography/${bblIDs}_${SubDate_and_ID}_ODIConNet.csv 
mv $out/tractography/ICVFNetworkCon.csv $out/tractography/${bblIDs}_${SubDate_and_ID}_ICVFConNet.csv 
cp $out/tractography/${bblIDs}_${SubDate_and_ID}_ICVFConNet.csv  $folder/
cp $out/tractography/${bblIDs}_${SubDate_and_ID}_ODIConNet.csv $folder/
cp $out/tractography/${bblIDs}_${SubDate_and_ID}_FAConNet.csv $folder/
echo $out/tractography/${bblIDs}_${SubDate_and_ID}_ICVFConNet.csv
cat $out/tractography/${bblIDs}_${SubDate_and_ID}_ICVFConNet.csv >> $folder/combinedICVFwIN.csv
cat $out/tractography/${bblIDs}_${SubDate_and_ID}_FAConNet.csv >> $folder/combinedFAwIN.csv
cat $out/tractography/${bblIDs}_${SubDate_and_ID}_ODIConNet.csv >> $folder/combinedODIwIN.csv
done
