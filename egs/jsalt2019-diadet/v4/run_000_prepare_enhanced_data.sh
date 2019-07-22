#!/bin/bash
# This script demonstrates how to run speech enhancement.


###################################
# Run speech enhancement
###################################
. ./path.sh
set -e

stage=1
config_file=default_config.sh

. parse_options.sh || exit 1;
. datapath.sh

OUTPUT_ROOT=./data_enhanced_aduios/m{MODE}_s{STAGE_SELECT} 

if [ $stage -le 1 ];then
    # Prepare the enhanced data of Babytrain.
    for partition in {train,dev,test}
    do
      dataDir=/export/fs01/jsalt19/databases/BabyTrain/${partition}
      outputDir=${OUTPUT_ROOT}/BabyTrain/${partition}

      $train_cmd_gpu  ./local/denoising_sig2sig.sh $dataDir $outputDir  
      exit
    done

fi
