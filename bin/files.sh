shopt -s dotglob
cp -r nicebox-master/bin/setup/etc /
cp -r nicebox-master/bin/setup/home/* /home/$1 --no-preserve=ownership
chown -R $1:$1 /home/$1
