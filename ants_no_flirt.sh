#!/bin/bash

IDs=$1

/data/jux/daviska/apines/ANTs/Scripts/antsRegistrationSyN.sh -d 3 -f /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/coreg/${IDs}_T1_betted_Inverse_Scaled_Masked.nii.gz -m /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/coreg/b0bet.nii.gz -o /data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}/prestats/${IDs}_T1_DWI_ra -t a
