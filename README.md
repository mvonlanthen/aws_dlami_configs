# aws_dlami_configs
Configuration files and tools for AWS Deep Learning AMI (DLAMI).

## Usage

### bashrc
Alias to add:
```bash
# Parameter from user
# -------------------

# more alias
alias lh='ls -lh'
```
### configure putty for ssh access with port forwarding

### configure vscode for remote access

### AWS boot3
Add the credential file to use the python module boto3.

### Python modules
Extra _must-have_ modules to install to conda and some often used conda commands.
* Check available environements:
  ```bash
  conda env list
  ```


### Jupyter Lab configuration
Jupyter lab configuration such as password protection, ssl encryption, no-browser launch and more. Most of the info below come from this [page](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html).
1. Copy the configuration file ``jupyter_notebook_config.py`` to ``/home/ubuntu/.jupyter``.
2. setup a password for your notebook:
   ```bash
   jupyter notebook password
   ```
3. Set up SSL encryption for communication: create you certificate with the following command
   ```bash
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
   ```
   this will create two files ``mykey.key`` and ``mycert.pem``. Create the folder ``/home/ubuntu/ssl`` and copy these files to it. Once done, check if the path to the certification in ``jupyter_notebook_config.py`` are correct. The server is now accessible with https.

### Jupyter Lab service
Add jupyter lab as a service starting at launch. Auto-relaunch enable. More info available [here](https://naysan.ca/2019/09/07/jupyter-notebook-as-a-service-on-ubuntu-18-04-with-python-3/).
1. copy the file ``jupyterlab.service`` to ``/etc/systemd/system``. (root access required). Make any updates in the file which might be required such as the launch directory or the executable path.
2. run the following command to start and enable the service
    ```bash
    sudo systemctl enable jupyter.service
    sudo systemctl daemon-reload
    sudo systemctl start jupyter.service
    systemctl status jupyter.service
    ```


