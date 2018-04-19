#!/bin/bash

## Grab ROI Statistics from HipoSubfields after masking out fISO >.8 ##
#general=/data/jux/daviska/lkini/GLUCEST/*
general=/data/jux/daviska/apines/3T_Subjects_NODDI/*
out=/data/jux/daviska/apines/3T_Sub_GroupStats
cdir=/data/joy/BBL/applications/camino/bin

#fslmaths ${general}/AMICO/NODDI/FIT_ISOVF.nii -uthr .9 -bin ${general}/coreg/Point8uthrBin.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LBA35.nii.gz ${general}/coreg/LBA35noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LBA36.nii.gz ${general}/coreg/LBA36noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LCA1.nii.gz ${general}/coreg/LCA1noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LCA2.nii.gz ${general}/coreg/LCA2noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LCA3.nii.gz ${general}/coreg/LCA3noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LDG.nii.gz ${general}/coreg/LDGnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LERC.nii.gz ${general}/coreg/LERCnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Lhead.nii.gz ${general}/coreg/LheadnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Lmisc.nii.gz ${general}/coreg/LmiscnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LPHC.nii.gz ${general}/coreg/LPHCnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LSUB.nii.gz ${general}/coreg/LSUBnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_LSulcus.nii.gz ${general}/coreg/LSulcusnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Ltail.nii.gz ${general}/coreg/LtailnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RBA35.nii.gz ${general}/coreg/RBA35noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RBA36.nii.gz ${general}/coreg/RBA36noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RCA1.nii.gz ${general}/coreg/RCA1noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RCA2.nii.gz ${general}/coreg/RCA2noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RCA3.nii.gz ${general}/coreg/RCA3noISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RDG.nii.gz ${general}/coreg/RDGnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RERC.nii.gz ${general}/coreg/RERCnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Rhead.nii.gz ${general}/coreg/RheadnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Rmisc.nii.gz ${general}/coreg/RmiscnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RPHC.nii.gz ${general}/coreg/RPHCnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RSUB.nii.gz ${general}/coreg/RSUBnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_RSulcus.nii.gz ${general}/coreg/RSulcusnoISO.nii.gz
#fslmaths ${general}/coreg/Point8uthrBin.nii.gz -mas ${general}/coreg/${IDs}_Rtail.nii.gz ${general}/coreg/RtailnoISO.nii.gz

#combine left subfields
#fslmaths ${general}/coreg/${IDs}_LBA35.nii.gz -add ${general}/coreg/${IDs}_LBA36.nii.gz -add ${general}/coreg/${IDs}_LCA1.nii.gz -add ${general}/coreg/${IDs}_LCA2.nii.gz -add ${general}/coreg/${IDs}_LCA3.nii.gz -add ${general}/coreg/${IDs}_LDG.nii.gz -add ${general}/coreg/${IDs}_LERC.nii.gz -add ${general}/coreg/${IDs}_Lhead.nii.gz -add ${general}/coreg/${IDs}_Lmisc.nii.gz -add ${general}/coreg/${IDs}_LPHC.nii.gz -add ${general}/coreg/${IDs}_LSUB.nii.gz -add ${general}/coreg/${IDs}_LSulcus.nii.gz -add ${general}/coreg/${IDs}_Ltail.nii.gz ${general}/coreg/${IDs}_LHippoSubs.nii.gz
#combine right
#fslmaths ${general}/coreg/${IDs}_RBA35.nii.gz -add ${general}/coreg/${IDs}_RBA36.nii.gz -add ${general}/coreg/${IDs}_RCA1.nii.gz -add ${general}/coreg/${IDs}_RCA2.nii.gz -add ${general}/coreg/${IDs}_RCA3.nii.gz -add ${general}/coreg/${IDs}_RDG.nii.gz -add ${general}/coreg/${IDs}_RERC.nii.gz -add ${general}/coreg/${IDs}_Rhead.nii.gz -add ${general}/coreg/${IDs}_Rmisc.nii.gz -add ${general}/coreg/${IDs}_RPHC.nii.gz -add ${general}/coreg/${IDs}_RSUB.nii.gz -add ${general}/coreg/${IDs}_RSulcus.nii.gz -add ${general}/coreg/${IDs}_Rtail.nii.gz ${general}/coreg/${IDs}_RHippoSubs.nii.gz
cdir=/data/joy/BBL/applications/camino/bin
##tractography_output=$out/tractography/${IDs}_HippoPrecunTract.Bdouble

##for i in $general; do
#	echo ${i}
#	a=$(echo ${i}|cut -d'/' -f7)
##	echo ${a}
#	3dROIstats -mask ${i} -1DRformat ${general}/AMICO/NODDI/FIT_OD.nii >> ${out}/${a}_ODI.txt
#	3dROIstats -mask ${i} -1DRformat ${general}/AMICO/NODDI/FIT_ICVF.nii >> ${out}/${a}_ICVF.txt
#	IDs=${a}
#	out=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}
#	tractography_output=$out/tractography/${IDs}_HippoPrecunTract.Bdouble
#	fslcpgeom ${out}/tractography/endpoint.nii.gz $out/tractography/${IDs}_Camino_FA.nii.gz
#	$cdir/conmat -inputfile "${tractography_output}" -targetfile ${out}/tractography/endpoint.nii.gz -scalarfile $out/tractography/${IDs}_Camino_FA.nii.gz -tractstat mean -outputroot $out/tractography/${IDs}_FA_matrix
#done

for i in $general; do
	#3dROIstats -mask ${general}/coreg/${IDs}_LHippoSubs.nii.gz -1DRformat ${general}/AMICO/NODDI/FIT_OD.nii >> ${out}/ODI_all.txt
	#3dROIstats -mask ${general}/coreg/${IDs}_RHippoSubs.nii.gz -1DRformat ${general}/AMICO/NODDI/FIT_OD.nii >> ${out}/ODI_all.txt
	#3dROIstats -mask ${general}/coreg/${IDs}_LHippoSubs.nii.gz -1DRformat ${general}/AMICO/NODDI/FIT_ICVF.nii >> ${out}/ICVF_all.txt
	#3dROIstats -mask ${i}/coreg/LBinarizedCoreHippo.nii.gz -1DRformat ${i}/AMICO/NODDI/FIT_ICVF.nii >> ${out}/Lhippocore_ICVF.txt	
	#3dROIstats -mask ${general}/coreg/${IDs}_RHippoSubs.nii.gz -1DRformat ${general}/AMICO/NODDI/FIT_ICVF.nii >> ${out}/ICVF_all.txt
	echo ${i}
	a=$(echo ${i}|cut -d'/' -f7)
	subj=${a}
	echo ${a}
	echo $subj >> ${out}/Precun_AngG_Hips_SC.txt
	echo $subj >> ${out}/Precun_AngG_Hips_ODmax.txt
	echo $subj >> ${out}/Precun_AngG_Hips_ODmean.txt

	#SC_files=${i}/tractography/*FA_matrix_HO_Precun_AngGHipssc.csv
#	echo $subj >> ${out}/HipThal_SC.txt
	#cat $SC_files >> ${out}/Precun_AngG_Hips_SC.txt
	#OD_files=${i}/tractography/*ODI_matrixmax_HO_Precun_AngGHipsts.csv
#	echo $subj >> ${out}/HipThal_SC.txt
	#cat $OD_files >> ${out}/Precun_AngG_Hips_ODmax.txt
	OD_filesme=${i}/tractography/*ODI_matrixmean_HO_Precun_AngGHipsts.csv
	cat $OD_filesme >> ${out}/Precun_AngG_Hips_ODmean.txt
#	FA_files=${i}/tractography/*_FA_matrixts.csv
#	echo $subj >> all_TractFA.csv
#	cat $FA_files >> all_TractFA.csv
#	ICVF_files=${i}/tractography/*_ICVF_matrixts.csv
#	echo $subj >> all_TractICVF.csv
#	cat $ICVF_files >> all_TractICVF.csv
	#Take out extra height in hippo segmentation
	#fslroi /data/jux/daviska/apines/GLUCEST/${a}/CEST/left_to_cest_3mm_bin.nii.gz /data/jux/daviska/apines/GLUCEST/${a}/CEST/Lmap50z 0 208 0 256 50 1
	#fslroi /data/jux/daviska/apines/GLUCEST/${a}/CEST/right_to_cest_3mm_bin.nii.gz /data/jux/daviska/apines/GLUCEST/${a}/CEST/Rmap50z 0 208 0 256 50 1
	#fslroi /data/jux/daviska/apines/GLUCEST/${a}/CEST/${a}_CEST_slice9_pad.nii.gz /data/jux/daviska/apines/GLUCEST/${a}/CEST/CEST50z 0 208 0 256 50 1
	# Pull ROI values from each subject into one csv
	#echo ${general}/CEST/${a}_CEST_slice9_pad.nii.gz 
	#echo ${general}/CEST/left_to_cest_3mm_bin.nii.gz
#	cat /data/jux/daviska/apines/3T_Subjects_NODDI/${a}/coreg/LHem_OD.txt >> ${out}/LHem_OD.txt
#	cat /data/jux/daviska/apines/3T_Subjects_NODDI/${a}/coreg/RHem_OD.txt >> ${out}/RHem_OD.txt
done

#ODI_files=$(find ${out}/*ODI.txt | sort -V)
#paste -d, $ODI_files > all_ODI.csv
#ICVF_files=$(find ${out}/*ICVF.txt | sort -V)
#paste -d, $ICVF_files > all_ICVF.csv

# Pull ROI values from each subject into one csv
#c3d ${general}/ashs/tse.nii.gz ${general}/ashs/final/ashs_left_lfseg_corr_usegray.nii.gz -lstat >> ${out}/left_lstats.txt
#c3d ${general}/ashs/tse.nii.gz ${general}/ashs/final/ashs_right_lfseg_corr_usegray.nii.gz -lstat >> ${out}/right_lstats.txt
#Vol_files=$(find ${out}/*lstats.txt | sort -V)
#paste -d, $Vol_files > all_ODI.csv



