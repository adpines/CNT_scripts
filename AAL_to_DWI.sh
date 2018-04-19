#!/bin/bash

IDs=$1
cdir=/data/joy/BBL/applications/camino/bin
ddir=/share/apps/dsistudio/2016-01-25/bin
general=/data/jux/daviska/apines/3T_Subjects_NODDI/*/
#for i in $general;do 
	#IDs=$(echo ${i}|cut -d'/' -f8 |sed s@'/'@' '@g);
	#SubDate_and_ID=$(echo ${i}|cut -d'/' -f9|sed s@'/'@' '@g|sed s@'x'@'x'@g)
	#Date=$(echo ${SubDate_and_ID}|cut -d',' -f1)
	#ID=$(echo ${SubDate_and_ID}|cut -d',' -f2)
###mkdir /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/tractography
out=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}
in=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/AMICO/
MNI=/data/jux/daviska/apines/atlases/MNI152_T1_1mm_brain.nii.gz
AAL=/data/jux/daviska/apines/atlases/AAL3_1mm_flipx.nii

antsApplyTransforms -d 3 -e 0 -i ${AAL} -r /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/coreg/${IDs}_DWISpaceT1.nii.gz -o  $out/coreg/${IDs}_DWISpace_AAL.nii.gz -t [$out/coreg/${IDs}_MultiShDiff2StructRas.mat,1] -t /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/coreg/${IDs}_MNI_T1_Warp1Warp.nii.gz -t  $out/coreg/${IDs}_MNI_T1_Warp0GenericAffine.mat -n NearestNeighbor
