Remove-Item ~/_vimrc
Remove-Item ~/vimfiles -Recurse -Force

Copy-Item .vimrc ~/_vimrc
Copy-Item .vim ~/vimfiles -Recurse -Force

