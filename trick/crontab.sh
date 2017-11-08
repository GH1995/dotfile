#!/bin/bash

conda update --all && conda clean --all
rsync -e "ssh -p 5102" -rvz --exclude='miniconda3' ~ guanhua@183.174.228.40:~/backup/$HOST
rsync -rvz --exclude-from="./list.txt" ~ hxs@47.95.240.181:~
