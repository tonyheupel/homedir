# homedir

This project is an attempt to share my common configurations in a
simple way across machines (without private info).

## Usage
Simply run this script:

Mac OSX
```shell
curl https://raw.githubusercontent.com/heupel/homedir/master/install.sh | sh
```

Windows
```shell
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/heupel/homedir/master/install.ps1'))" 
```
