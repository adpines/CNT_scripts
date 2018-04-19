#!/bin/bash


IDs=$1
cdir=/data/joy/BBL/applications/camino/bin
ddir=/share/apps/dsistudio/2016-01-25/bin
general=/data/jux/daviska/apines/3T_Subjects_NODDI/*/
out=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}
in=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/AMICO/
MNI=/data/jux/daviska/apines/atlases/MNI152_T1_1mm_brain.nii.gz
AAL=/data/jux/daviska/apines/atlases/AAL3_1mm_flipx.nii.gz
subAAL=$out/coreg/${IDs}_DWISpace_AAL.nii.gz
tractography_output=${out}/tractography/DilledHips.Bdouble

eddy_outdir=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/prestats/eddy

masked_b0=${eddy_outdir}/${IDs}_eddied_initMasked_b0.nii.gz

# SC
$cdir/conmat -inputfile ${tractography_output} -targetfile ${out}/tractography/HippoThalHO.nii.gz -scalarfile $out/coreg/FIT_OD.nii -outputroot $out/tractography/${IDs}_DilledHips

# Mean ICVF matrix
##$cdir/conmat -inputfile ${tractography_output} -targetfile ${subAAL} -scalarfile $out/coreg/FIT_ICVF.nii -tractstat mean -outputroot $out/tractography/${IDs}_ICVF_prob_05FAThresh

# Mean ODI matrix
##$cdir/conmat -inputfile ${tractography_output} -targetfile ${subAAL} -scalarfile $out/coreg/FIT_OD.nii -tractstat mean -outputroot $out/tractography/${IDs}_ODI_prob_05FAThresh

# Mean FA matrix
#shady step to make FA and AAL equivalent
##fslcpgeom ${subAAL} $out/tractography/${IDs}_Camino_FA.nii.gz

##$cdir/conmat -inputfile ${tractography_output} -targetfile ${subAAL} -scalarfile $out/tractography/${IDs}_Camino_FA.nii.gz -tractstat mean -outputroot $out/tractography/${IDs}_FA_prob_05FAThresh
