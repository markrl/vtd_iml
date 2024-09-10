#!/bin/sh
lang=$1
flags=$2
echo $lang
echo $flags

runname=icassp_$lang

rm -rf output/${runname}
mkdir output/${runname}
rm -rf checkpoints/${runname}
mkdir checkpoints/${runname}

for n_queries in 2 4 6 8 10 12 14 16; do
    tmux new-session -d -s icassp_${lang}_${n_queries} "source ~/oalcf/bin/activate; cd ~/research/vtd_iml; python run.py --run_name ${runname}/queries${n_queries} --lid_target $lang --env_name test --n_queries ${n_queries} $flags"
done