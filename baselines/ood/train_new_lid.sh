#!/bin/sh
runname=$1
flags=$2
echo $runname
echo $flags

rm -rf baselines/ood/output/${runname}
mkdir baselines/ood/output/${runname}
rm -rf checkpoints/${runname}
mkdir checkpoints/${runname}

for lang in id vi yue; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf3.11.7/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "CUDA_VISIBLE_DEVICES=0 python baselines/ood/train_ood.py --ckpt_name ${runname}/${lang} --lid_target ${lang} --feat_root /data1/SoutheastAsianLID/ecapalang/ ${flags}^M"
done

for lang in cnh dv hi; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf3.11.7/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "CUDA_VISIBLE_DEVICES=1 python baselines/ood/train_ood.py --ckpt_name ${runname}/${lang} --lid_target ${lang} --feat_root /data1/SouthAsianLID/ecapalang/ ${flags}^M"
done

for lang in ml mr; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf3.11.7/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "CUDA_VISIBLE_DEVICES=0 python baselines/ood/train_ood.py --ckpt_name ${runname}/${lang} --lid_target ${lang} --feat_root /data1/SouthAsianLID/ecapalang/ ${flags}^M"
done

for lang in skr or; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf3.11.7/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "CUDA_VISIBLE_DEVICES=1 python baselines/ood/train_ood.py --ckpt_name ${runname}/${lang} --lid_target ${lang} --feat_root /data1/SouthAsianLID/ecapalang/ ${flags}^M"
done