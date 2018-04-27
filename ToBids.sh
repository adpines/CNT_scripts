#!/bin/bash


############################################################################################################
### BIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDSBIDS ###
# 4/13/18  - created########################################################################################
###### 4/18/18 - sifted through all the B0 BS ##############################################################
######################### 4/23/18 - .json additions   ######################################################
######################################### 4/25/18 .json fixes, bvecs fix ###################################
############################################################## 4/26 - WORKS ################################ 
###################################################################### 4/27 added phase encoding to rsfMRI #
############################################################################################################

#### NOTE: This does not distinguish in output b/w patients and controls. Replace "sub" with control when running on controls #####
### 3T Pre-HCP version (fMRI parameters/b0 mapping will need updating for future versions) ###

# Argument input is 3T ID, (i.e., 3T_P12). Note structurals are taken from Lohith's directory, and diffusion from mine. This was done because subject files are uniformly named in these directories, and more intuitive to code for. BUT, this will mean thats future subjects will not have this information present. See commented out commands at bottom of script for basis of pulling these from initial upload format data.

ID=$1
Num=$(echo ${ID}|cut -b 5-7)


###################################################### Make Dirs

GrandParent=/data/jux/daviska/3T_Subjects
Parent=/data/jux/daviska/apines/3T_BIDS/sub-${Num}
mkdir /data/jux/daviska/apines/3T_BIDS/sub-${Num}
mkdir ${Parent}/anat
mkdir ${Parent}/func
mkdir ${Parent}/dwi
mkdir ${Parent}/fmap
mkdir ${Parent}/tmp

### CP dirs from current state (Init format)
##################################################### Get images
## rsfMRI ##
cp ${GrandParent}/${ID}/*rest*/* ${Parent}/tmp/
cd ${Parent}/tmp
dcm2nii *
cp *.nii.gz ${Parent}/func/sub-${Num}_task-rest_bold.nii.gz
rm ${Parent}/tmp/*

## Diffusion ##
# Names for DWIs heterogeheterogeneous like the B0s, but I have the DWIs from my NODDI pipeline already. 

cp /data/jux/daviska/apines/3T_Subjects_NODDI/${ID}/AMICO/dwi.nii ${Parent}/dwi/sub-${Num}_dwi.nii
gzip ${Parent}/dwi/sub-${Num}_dwi.nii
cp /data/jux/daviska/apines/3T_Subjects_NODDI/${ID}/AMICO/bvals ${Parent}/dwi/sub-${Num}_dwi.bval
cp /data/jux/daviska/apines/3T_Subjects_NODDI/${ID}/AMICO/bvecs ${Parent}/dwi/sub-${Num}_dwi.bvec

# Change bvecs to single space delimited instead of double spaced

sed -i 's/  / /g' ${Parent}/dwi/sub-${Num}_dwi.bvec

## Structural ##
# Pulling structurals from Lohith's directory since it looks like he already did some of the sifting

cp /data/jux/daviska/lkini/3T_Subjects/${ID}/img/orig/T1/nii/${ID}_3T_T1.nii.gz ${Parent}/anat/sub-${Num}_T1w.nii.gz

cp /data/jux/daviska/lkini/3T_Subjects/${ID}/img/orig/T2/nii/${ID}_3T_T2.nii.gz ${Parent}/anat/sub-${Num}_T2w.nii.gz

## Field maps (Magnitude) ##
cp /data/jux/daviska/apines/B0_Mag/${ID}/* ${Parent}/tmp/
cd ${Parent}/tmp
dcm2nii *
cp ${Parent}/tmp/*.nii.gz ${Parent}/fmap/sub-${Num}_magnitude1.nii.gz
rm *

## Phase ##
cp /data/jux/daviska/apines/B0_Phase/${ID}/* ${Parent}/tmp/
cd ${Parent}/tmp
dcm2nii *
cp ${Parent}/tmp/*.nii.gz ${Parent}/fmap/sub-${Num}_phasediff.nii.gz
rm *

## Take out tmp ##
rm -r ${Parent}/tmp

############################################################## Make .json files
# Dataset description
rm /data/jux/daviska/apines/3T_BIDS/dataset_description.json
echo { >> /data/jux/daviska/apines/3T_BIDS/dataset_description.json
echo   "\"BIDSVersion"\" : "\"1.0.11"\",   >> /data/jux/daviska/apines/3T_BIDS/dataset_description.json
echo   "\"Name"\": "\"HUP Research Scans"\"   >> /data/jux/daviska/apines/3T_BIDS/dataset_description.json
#echo   "\"Patient"\": "\"${ID}"\" >> ${Parent}/dataset_description.json
echo } >> /data/jux/daviska/apines/3T_BIDS/dataset_description.json

# Fieldmap echo times
echo {"\"EchoTime2"\": 0.00559, "\"EchoTime1"\": 0.00313, "\"IntendedFor"\": "\"func/sub-${Num}_task-rest_bold.nii.gz"\"} >> ${Parent}/fmap/sub-${Num}_phasediff.json

# fMRI param
echo { "\"TaskName"\": "\"Rest"\", "\"RepetitionTime"\": 0.5, "\"EchoTime"\": 0.03, "\"PhaseEncodingDirection"\": "\"j"\" }>>${Parent}/func/sub-${Num}_task-rest_bold.json

############ Direct pulls from raw folder (if needed, but more troublesome/will probably work for less subjects)
# DWI
#cp ${GrandParent}/${ID}/*Multishell*/* ${Parent}/tmp/
#cd ${Parent}/tmp
#dcm2nii *

# T1
#cp ${GrandParent}/${ID}/*T1*/* ${Parent}/tmp/
#cd ${Parent}/tmp
#dcm2nii *
#rm *.dcm
#cp ${Parent}/tmp/*.nii.gz 

# T2
#cp ${GrandParent}/${ID}/*T2*/* ${Parent}/tmp/
#cd ${Parent}/tmp
#dcm2nii *
#rm *.dcm
#cp ${Parent}/tmp/*.nii.gz ${Parent}/anat/sub-${Num}_T2w.nii.gz
#rm ${Parent}/tmp/*
