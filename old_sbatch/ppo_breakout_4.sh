#!/bin/bash

# Lines that begin with #SBATCH specify commands to be used by SLURM for scheduling

#SBATCH --job-name=ppo_breakout_4                                 # sets the job name
#SBATCH --output=ppo_breakout_4.out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=ppo_breakout_4.out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=5:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=default                                           # set QOS, this will determine what resources can be requested
#SBATCH --partition=class
#SBATCH --mem=8gb                                               # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1

module load cuda/10.1.243                                       # run any commands necessary to setup your environment

srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo ppo --use-gae --lr 2.5e-4 --clip-param 0.1 --value-loss-coef 0.5 --num-processes 8 --num-steps 128 --num-mini-batch 4 --log-interval 1 --use-linear-lr-decay --entropy-coef 0.01 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/ppo_breakout_4/"

# once the end of the batch script is reached your job allocation will be revoked
