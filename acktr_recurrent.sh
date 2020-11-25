#!/bin/bash

# Lines that begin with #SBATCH specify commands to be used by SLURM for scheduling

#SBATCH --job-name=acktr_recurrent                                # sets the job name
#SBATCH --output=acktr_recurrent.out.%j                            # indicates a file to redirect STDOUT to; %j is the jobid 
#SBATCH --error=acktr_recurrent.out.%j                             # indicates a file to redirect STDERR to; %j is the jobid
#SBATCH --time=48:00:00                                          # how long you think your job will take to complete; format=hh:mm:ss
#SBATCH --qos=default                                           # set QOS, this will determine what resources can be requested
#SBATCH --partition=class
#SBATCH --mem=8gb                                               # memory required by job; if unit is not specified MB will be assumed
#SBATCH --gres=gpu:1

module load cuda/10.1.243                                       # run any commands necessary to setup your environment

srun bash -c "hostname; python main.py --env-name=BeamRiderNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_beamrider_recurrent_1/"
srun bash -c "hostname; python main.py --env-name=BeamRiderNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_beamrider_recurrent_2/"
srun bash -c "hostname; python main.py --env-name=BeamRiderNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_beamrider_recurrent_3/"
srun bash -c "hostname; python main.py --env-name=BeamRiderNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_beamrider_recurrent_4/"
srun bash -c "hostname; python main.py --env-name=BeamRiderNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_beamrider_recurrent_5/"

srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_breakout_recurrent_1/"
srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_breakout_recurrent_2/"
srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_breakout_recurrent_3/"
srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_breakout_recurrent_4/"
srun bash -c "hostname; python main.py --env-name=BreakoutNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_breakout_recurrent_5/"

srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_qbert_recurrent_1/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_qbert_recurrent_2/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_qbert_recurrent_3/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_qbert_recurrent_4/"
srun bash -c "hostname; python main.py --env-name=QbertNoFrameskip-v4 --algo acktr --recurrent-policy --num-processes 32 --num-steps 20 --lr 7e-4 --log-dir=/fs/classhomes/fall2020/cmsc828w/c828w021/pytorch-a2c-ppo-acktr-gail/acktr_qbert_recurrent_5/"

# once the end of the batch script is reached your job allocation will be revoked
