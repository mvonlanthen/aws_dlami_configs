#!/bin/bash


# User parameters
# ---------------
root_folder_struc="/home/ubuntu/attached_home"  #the attached "home" folder

# go in the home folder
cd ~
echo pwd

# update the bashrc. Add your aliases here
echo "update .bashrc"
echo "

# User parameters
# ---------------
alias lh=\"ls -lh\"" >> .bashrc
source .bashrc

# create the folder structure
echo "create folders structure"
mkdir "$root_folder_struc/"datasets
mkdir "$root_folder_struc/"development
mkdir "$root_folder_struc/"downloads
mkdir "$root_folder_struc/"models
mkdir "$root_folder_struc/"projects

# update Anaconda, Jupyter Lab and other envs
echo "update Anaconda"
conda install nodejs -y
jupyter labextension install @jupyterlab/toc

conda install -n tensorflow2_p36 tqdm -y
conda install -n tensorflow_p36 tqdm -y


# Set up Jupyter Lab as a startup service
echo "set up jupyter lab"
cp aws_dlami_configs/jupyter_notebook_config.py .jupyter/
mkdir ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=CH/ST=Zurich/L=Zurich/O=organization/CN=name" -keyout ssl/mykey.key -out ssl/mycert.pem

echo "set Jupyter lab as a system service"
sudo cp aws_dlami_configs/jupyterlab.service /etc/systemd/system/
sudo systemctl enable jupyterlab.service
sudo systemctl daemon-reload
sudo systemctl start jupyterlab.service




