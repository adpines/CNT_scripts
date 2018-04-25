#!/bin/bash


#50 and anis and endpoint
/data/joy/BBL/applications/camino/bin/track -inputmodel dt -seedfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/3T_P15_DWISpace_AAL.nii.gz -inputfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/tractography/3T_P15_WdtModelFit.Bdouble -tracker euler -interpolator linear -iterations 10 -curvethresh 50 -anisthresh 0.05 -anisfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/tractography/3T_P15_Camino_FA.nii.gz | /data/joy/BBL/applications/camino/bin/procstreamlines -exclusionfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/ISO_9.nii.gz -truncateinexclusion -mintractlength 10 -maxtractlength 105 -endpointfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/figure/0.nii.gz -outputfile ~/3T_P15_e_tl120.Bfloat
#| /data/joy/BBL/applications/camino/bin/procstreamlines  -outputfile ~/3T_P15_e_tl.Bfloat

#endpoint
#/data/joy/BBL/applications/camino/bin/track -inputmodel dt -seedfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/3T_P15_DWISpace_AAL.nii.gz -inputfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/tractography/3T_P15_WdtModelFit.Bdouble -tracker euler -interpolator linear -iterations 10 -curvethresh 50 | /data/joy/BBL/applications/camino/bin/procstreamlines -endpointfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/figure/0.nii.gz -outputfile ~/3T_P15_e.Bfloat

/data/jux/daviska/apines/camino-trackvis-0.2.8.1/bin/camino_to_trackvis -i ~/3T_P15_e_tl120.Bfloat -o ecog_streamlinesaa_e_tl120.trk --nifti /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/prestats/3T_P15_eddied_undistort_warped_t1Masked.nii.gz --phys-coords

#cat ~/3T_P15_e.Bfloat | /data/joy/BBL/applications/camino/bin/procstreamlines -endpointfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/figure/0.nii.gz -outputfile ~/e.Bfloat

#50
#/data/joy/BBL/applications/camino/bin/track -inputmodel dt -seedfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/3T_P15_DWISpace_AAL.nii.gz -inputfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/tractography/3T_P15_WdtModelFit.Bdouble -outputfile ~/3T_P15_50.Bdouble -tracker euler -interpolator linear -iterations 10 -curvethresh 50 

#/data/jux/daviska/apines/camino-trackvis-0.2.8.1/bin/camino_to_trackvis -i ~/3T_P15_50.Bdouble -o ecog_streamlinesaa50.trk --nifti /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/prestats/3T_P15_eddied_undistort_warped_t1Masked.nii.gz --phys-coords

# Oldschool
#/data/joy/BBL/applications/camino/bin/track -inputmodel dt -seedfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/3T_P15_DWISpace_AAL.nii.gz -inputfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/tractography/3T_P15_WdtModelFit.Bdouble -tracker euler -interpolator linear -iterations 10 -curvethresh 60 | /data/joy/BBL/applications/camino/bin/procstreamlines -exclusionfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/CSFandISO.nii.gz -truncateinexclusion -endpointfile /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/coreg/figure/0.nii.gz -outputfile ~/3T_P15_old.Bfloat

#/data/jux/daviska/apines/camino-trackvis-0.2.8.1/bin/camino_to_trackvis -i ~/3T_P15_old.Bfloat -o ecog_streamlinesaa_old.trk --nifti /data/jux/daviska/apines/3T_Subjects_NODDI/3T_P15/prestats/3T_P15_eddied_undistort_warped_t1Masked.nii.gz --phys-coords
