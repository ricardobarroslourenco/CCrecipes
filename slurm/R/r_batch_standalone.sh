#!/bin/bash

### Sets shell for parallel program (no distribution - no MPI)
### Inspired by the current documentation available on CC Wiki.

#SBATCH --account=def-someacct             # replace this with your PI account
#SBATCH --nodes=1                          # number of node MUST be 1
#SBATCH --cpus-per-task=4                  # number of processes
#SBATCH --mem-per-cpu=2048M                # memory; default unit is megabytes
#SBATCH --time=0-00:15                     # time (DD-HH:MM)
#SBATCH --mail-user=yourname@someplace.com # Send email updates to you or someone else
#SBATCH --mail-type=ALL                    # send an email in all cases (job started, job ended, job aborted)

### Load library modules
module load gcc/9.3.0 r/4.0.2

### Load r-packages (builds locally) - comment, if unecessary to install new libraries
#R install_script.R

### Export locally installed packages
# TODO: check if this path holds
export R_LIBS=~/local/R_libs/

### Run main_job.R - or any batch script necessary
R CMD BATCH --no-save --no-restore main_job.R