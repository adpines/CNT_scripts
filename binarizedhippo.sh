#!/bin/bash

### Create a hippocampal area mask (with PHC, BA35 and 36, ERC) for tractography

## Merge hippocampal subfields in DWI space into one mask, doesn't exclude subjects missing regions.
hgeneral=/data/jux/daviska/apines/3T_Subjects_NODDI/*

for i in ${hgeneral}; do
	fslmaths ${i}/coreg/*_RHippoSubs.nii.gz -thr 1 -uthr 14 -bin ${i}/coreg/RBinarizedHippo.nii.gz
	fslmaths ${i}/coreg/*_LHippoSubs.nii.gz -thr 1 -uthr 14 -bin ${i}/coreg/LBinarizedHippo.nii.gz
	fslmaths ${i}/coreg/RBinarizedHippo.nii.gz -add ${i}/coreg/LBinarizedHippo.nii.gz ${i}/coreg/BinarizedHippo.nii.gz
	echo ${i}
done
