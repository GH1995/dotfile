#!/bin/bash

conda update --all && conda clean --all
rsync -e "ssh -p 5102" -rvz --exclude='miniconda3' ~ guanhua@183.174.228.40:~/backup/$HOST
