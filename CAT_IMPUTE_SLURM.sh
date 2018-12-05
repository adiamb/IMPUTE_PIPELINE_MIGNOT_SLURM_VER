#!/bin/bash
touch CAT_IMPUTE.sh
chmod 755 CAT_IMPUTE.sh
cat > CAT_IMPUTE.sh <<- EOF
#!/bin/bash -l
#SBATCH --job-name=catimpute_files
#SBATCH --mem-per-cpu=16000
#SBATCH --array=1-22
#SBATCH --account=mignot
#SBATCH --time=120:00:00
module load python/2.7
python CONCAT_IMPUTE.py -F CHR\${SLURM_ARRAY_TASK_ID}_$1
EOF
sbatch --export=ALL CAT_IMPUTE.sh
