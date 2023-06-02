## 
# Generated with hmexpfamily 0.1.0+editable 2023-06-02T21:24:07.161759
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

cd base/

## Apply file replacements for ecf/config_exp.h

# DOMAIN: DKCOEXP -> DENMARK
sed -i 's/^DOMAIN=DKCOEXP/DOMAIN=DENMARK/' ecf/config_exp.h


## Apply file replacements for scr/Fldextr

# lprintrad: F -> T
sed -i 's/lprintrad=F/lprintrad=T/' scr/Fldextr


## Apply file replacements for Env_system

# CLEANING_LEVEL: fast -> default
sed -i 's/^export CLEANING_LEVEL=fast/export CLEANING_LEVEL=default/' Env_system


cd -