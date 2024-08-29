#!/bin/sh
runname=$1
flags=$2
echo $runname
echo $flags

rm -rf output/${runname}
mkdir output/${runname}
rm -rf checkpoints/${runname}
mkdir checkpoints/${runname}

for lang in ha yo bas; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data1/AfricanContinentLID/ecapalang/ ${flags}^M"
done

for lang in ckb kmr sr; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data1/CaucasusRegionLID/ecapalang/ ${flags}^M"
done

for lang in tt cv; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data1/CaucasusRegionLID/ecapalang/ ${flags}^M"
done

for lang in ky hy-AM; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data1/CaucasusRegionLID/ecapalang/ ${flags}^M"
done

for lang in id vi yue; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data/SoutheastAsianLID/ecapalang/ ${flags}^M"
done

for lang in cnh dv hi ml mr skr or; do
    screen -dmS ${runname}_${lang} 
    screen -S ${runname}_${lang} -X stuff "source ~/oalcf/bin/activate^M"
    screen -S ${runname}_${lang} -X stuff "python run.py --run_name ${runname}/${lang} --env_name test --lid_target ${lang} --feat_root /data/SouthAsianLID/ecapalang/ ${flags}^M"
done