Remove-Item ~/_vimrc
Remove-Item ~/vimfiles -recurse -force

Copy-Item .vimrc ~/_vimrc
Copy-Item .vim ~/vimfiles -recurse -force

New-Item ~/vimfiles/_backup -type directory -force
New-Item ~/vimfiles/_temp -type directory -force

(Get-Content ~/_vimrc) -replace "~/.vim/","~/vimfiles/" | Set-Content ~/_vimrc
