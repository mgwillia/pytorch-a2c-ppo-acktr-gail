#!/bin/bash

# Lines that begin with #SBATCH specify commands to be used by SLURM for scheduling

#SBATCH --job-name=a2c_breakout_3                                 # sets the job name
#SBATCH --output=a2c_breakout_3.out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=a2c_breakout_3.out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=5:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=default                                           # set QOS, this will determine what resources can be requested
#SBATCH --partition=class
#SBATCH --mem=8gb                                               # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1

module load cuda/10.1.243                                       # run any commands necessary to setup your environment

srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/a2c_breakout_3/"

# once the end of the batch script is reached your job allocation will be revoked
