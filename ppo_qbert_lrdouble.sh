#!/bin/bash

# Lines that begin with #SBATCH specify commands to be used by SLURM for scheduling

#SBATCH --job-name=ppo_qbert_lrdouble                                # sets the job name
#SBATCH --output=ppo_qbert_lrdouble.out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=ppo_qbert_lrdouble.out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=24:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=default                                           # set QOS, this will determine what resources can be requested
#SBATCH --partition=class
#SBATCH --mem=8gb                                               # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1

module load cuda/10.1.243                                       # run any commands necessary to setup your environment

srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo ppo --use-gae --lr 5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_qbert_lrdouble_1/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo ppo --use-gae --lr 5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_qbert_lrdouble_2/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo ppo --use-gae --lr 5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_qbert_lrdouble_3/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo ppo --use-gae --lr 5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_qbert_lrdouble_4/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo ppo --use-gae --lr 5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_qbert_lrdouble_5/"

# once the end of the batch script is reached your job allocation will be revoked
