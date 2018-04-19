#!/bin/bash
IDs=$1
#general=/data/jux/daviska/3T_Subjects/$IDs
mkdir /data/jux/daviska/apines/3T_Subjects_NODDI/TLEatlasASHS
mkdir /data/jux/daviska/apines/3T_Subjects_NODDI/TLEatlasASHS/${IDs}
export ASHS_ROOT=/data/jux/daviska/apines/ashs-1.0.0
/data/jux/daviska/apines/ashs-1.0.0/bin/ashs_main.sh -a /data/jux/daviska/apines/ashs_atlas_penntle_hippo_20170915 -g /data/jux/daviska/lkini/3T_Subjects/${IDs}/img/orig/T1/nii/${IDs}_3T_T1.nii.gz -f /data/jux/daviska/lkini/3T_Subjects/${IDs}/img/orig/T2/nii/${IDs}_3T_T2.nii.gz -w /data/jux/daviska/apines/3T_Subjects_NODDI/TLEatlasASHS/${IDs}


