#!/bin/bash

cd /etc/systemd && sed -i s/"#SuspendState=mem standby freeze"/SuspendState=freeze/g sleep.conf
