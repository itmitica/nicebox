shopt -s dotglob
cp -r setup/etc /
cp -r setup/home/* /home/$1 --no-preserve=ownership
mkdir /home/$1/bin
cp -r * /home/$1/bin --no-preserve=ownership
chown -R $1:$1 /home/$1
