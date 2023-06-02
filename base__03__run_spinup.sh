## 
# Generated with hmexpfamily 0.1.0+editable 2023-06-02T21:24:07.166654
# from `expfamily.yaml` with content:
#
# ---
# base:
#   name: PVPS_aerosols_10apr2015
#   platform: ECMWF.atos
#   meta:
#     start_datetime: 2015-04-10T00:00
#     end_datetime: 2015-05-11T00:00
#     spinup_duration: P1D
#     disable_sanidisk: true
#   source:
#     repo: https://github.com/leifdenby/Harmonie
#     revision: 83c82c7
#   files:
#     ecf/config_exp.h:
#       DOMAIN: DENMARK
#     Env_system:
#       CLEANING_LEVEL: default # ensure boundary, obs etc files are never deleted so that we can reuse with other experiments
#     scr/Fldextr:
#       lprintrad: T # output irridiance variables to VFLD files
# 
# variants:
#   CAMSAOD:
#     meta:
#       reuse_base_inputs: true
#     files:
#       ecf/config_exp.h:
#         CAERO: camsaod
#       Env_system:
#         CLEANING_LEVEL: default # ensure boundary, obs etc files are never deleted so that we can reuse with other experiments
#   
#   CAMSNRT:
#     meta:
#       reuse_base_inputs: true
#     files:
#       ecf/config_exp.h:
#         USEAERO: camsnrt
#         CAERO: __ignored__
#       Env_system:
#         CLEANING_LEVEL: default # ensure boundary, obs etc files are never deleted so that we can reuse with other experiments
# ---
#
##

# commit current experiment family setup
cd base/
git add .
git commit -m 'commit changes to base'
git push origin PVPS_aerosols_10apr2015
cd -
git add *.sh expfamily.yaml base output
git commit -m 'about to run experiment'

# launch a cold-start run as the spin-up simulation from $PERM where Harmonie
# expects it
cd $PERM/hm_home/PVPS_aerosols_10apr2015__base

./config-sh/Harmonie start DTG=2015040900 DTGEND=2015041000

cd -