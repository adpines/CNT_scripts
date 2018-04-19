#!/bin/bash

IDs=$1
out=/data/jux/daviska/apines/3T_Subjects_NODDI/${IDs}
cdir=/data/joy/BBL/applications/camino/bin

####DOUBLE DIL#######

fslmaths ${out}/coreg/RLBinHippo.nii.gz -dilM ${out}/coreg/BinarizedHippoDil1
##fslmaths ${out}/coreg/BinarizedHippoDil1.nii.gz -dilM ${out}/coreg/DoubleDilBinHip
fslmaths ${out}/coreg/BinarizedHippoDil.nii.gz -mul 3 ${out}/coreg/DilBinHipMult
fslmaths ${out}/coreg/DilBinHipMult.nii.gz -add ${out}/coreg/BinarizedHippo.nii.gz ${out}/coreg/DillorNoDill.nii.gz

######## Get tracts from BinHip (ashs generated) to parahippocampal space#########

export CAMINO_HEAP_SIZE=10000

tractography_output=${out}/tractography/DilledHips.Bdouble
seed_path=${out}/coreg/DillorNoDill.nii.gz
exclusion_path=${out}/coreg/CSFandISO.nii.gz
model_fit_path=$out/tractography/${IDs}_WdtModelFit.Bdouble

### Track that (all on the floor)  ####

$cdir/track -inputmodel dt -seedfile "${seed_path}" -inputfile "${model_fit_path}" -tracker euler -interpolator linear -iterations 10 -curvethresh 70 | $cdir/procstreamlines -exclusionfile "${exclusion_path}" -truncateinexclusion -outputfile "${tractography_output}"

### Convert camino tracts to trackvis format

/data/jux/daviska/apines/camino-trackvis-0.2.8.1/bin/camino_to_trackvis -i ${tractography_output} -o ${out}/tractography/${IDs}_streamlinesHH.trk --nifti $out/prestats/${IDs}_eddied_undistort_warped_t1Masked.nii.gz --phys-coords

### get dat connnectivity matrix ####

#Intracellular volume fraction 
$cdir/conmat -inputfile "${tractography_output}" -targetfile ${seed_path} -scalarfile $out/coreg/FIT_ICVF.nii -tractstat mean -outputroot $out/tractography/${IDs}_ICVF_Hip2ParaHip
