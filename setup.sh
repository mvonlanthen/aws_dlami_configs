#!/bin/bash


cd ~
echo pwd


echo "update .bashrc"
echo "

User parameters
---------------
alias lh=\"ls -lh\"" >> .bashrc
source .bashrc

echo "update Anaconda"
conda install jupyterlab -y
conda install nodejs -y
jupyter labextension install @jupyterlab/toc

# conda install -n tensorflow2_p36 tqdm pandas
# conda install -n tensorflow_p36 tqdm pandas

echo "set up jupyter lab"
cp aws_dlami_configs/jupyter_notebook_config.py .jupyter/
mkdir ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=CH/ST=Zurich/L=Zurich/O=organization/CN=name" -keyout ssl/mykey.key -out ssl/mycert.pem

echo "set Jupyter lab as a system service"
sudo cp aws_dlami_configs/jupyterlab.service /etc/systemd/system/
sudo systemctl enable jupyterlab.service
sudo systemctl daemon-reload
sudo systemctl start jupyterlab.service




