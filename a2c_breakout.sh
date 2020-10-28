#!/bin/bash

# Lines that begin with #SBATCH specify commands to be used by SLURM for scheduling

#SBATCH --job-name=a2c_breakout                                 # sets the job name
#SBATCH --output=a2c_breakout.out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=a2c_breakout.out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=8:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=default                                           # set QOS, this will determine what resources can be requested
#SBATCH --partition=class
#SBATCH --mem=2gb                                               # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1

module load cuda/10.1.243                                       # run any commands necessary to setup your environment

srun --mem=2gb bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4"

# once the end of the batch script is reached your job allocation will be revoked