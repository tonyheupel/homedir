# homedir

This project is an attempt to share my common configurations in a
simple way across machines (without private info).

## Usage
Simply run this script:

Mac OSX
```shell
curl https://raw.github.com/tchype/homedir/HEAD/install.sh | sh
```

Windows
```shell
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://raw.github.com/tchype/homedir/head/install.ps1'))" 
```
