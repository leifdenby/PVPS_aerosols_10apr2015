## 
# Generated with hmexpfamily 0.1.0+editable 2023-06-02T21:24:07.158809
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

# Checkout a specific revision of Harmonie soure code by adding it as a
# submodule
git init
git submodule add https://github.com/leifdenby/Harmonie base
cd base
git checkout 83c82c7 -b PVPS_aerosols_10apr2015
cd -

# Add a commit to the experiment family repo to registered that we're using
# this commit
git add .
git commit -m "Use Harmonie revision 83c82c7"

# Symlink the "base" experiment into hm_home on $PERM where Harmone expects it
# to be
ln -s /etc/ecmwf/nfs/dh2_perm_b/nhae/Projects/PVPS/experiment_families/10apr2015/base $PERM/hm_home/PVPS_aerosols_10apr2015__base

## Create a symlink to where Harmonie will replace the output
mkdir -p output/
ln -s $SCRATCH/hm_home/PVPS_aerosols_10apr2015__base /etc/ecmwf/nfs/dh2_perm_b/nhae/Projects/PVPS/experiment_families/10apr2015/output/base

# And run setup for Harmonie
cd $PERM/hm_home/PVPS_aerosols_10apr2015__base
./config-sh/Harmonie setup -r $(pwd) -h ECMWF.atos
cd -