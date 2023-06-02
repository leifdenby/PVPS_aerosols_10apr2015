## 
# Generated with hmexpfamily 0.1.0+editable 2023-06-02T21:24:07.170580
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


# Create a directory to store the CAMSAOD variant of the
# PVPS_aerosols_10apr2015 experiment
mkdir variant__CAMSAOD

# Setup Harmonie in $PERM with this variant experiment by symlinking to the
# base experiment repo
cd variant__CAMSAOD
ln -sf $PERM/hm_home/PVPS_aerosols_10apr2015__base/config-sh/Harmonie
./Harmonie setup -r $PERM/hm_home/PVPS_aerosols_10apr2015__base
cd -

# Symlink the variant experiment into hm_home on $SCRATCH where Harmone expects it
# to be
ln -s /etc/ecmwf/nfs/dh2_perm_b/nhae/Projects/PVPS/experiment_families/10apr2015/variant__CAMSAOD $PERM/hm_home/PVPS_aerosols_10apr2015__variant__CAMSAOD

# Create a symlink in output/variant__CAMSAOD to where Harmonie will
# place the output for ease of access later
ln -s $SCRATCH/hm_home/PVPS_aerosols_10apr2015__variant__CAMSAOD /etc/ecmwf/nfs/dh2_perm_b/nhae/Projects/PVPS/experiment_families/10apr2015/output/variant__CAMSAOD

