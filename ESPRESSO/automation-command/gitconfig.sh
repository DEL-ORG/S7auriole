#!/bin/bash
 git config --global user.name "s7testar"
 git config --global user.email attamegnon@gmail.com
 git status
 sleep 5
 git add /student_home/ESPRESSOO
 git status
 sleep 5
 git commit -m "update automation command"
 git remote set-url origin https://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@github.com/s7testar/EPRESSOO
 git push 
 sleep 8
 git status
# git remote set-url origin https://token.com/username/repositoryname
# git config --global core.editor (set the whole path to the vscode editor)
# git config --global init.defaultbranch (whatever name you want to give to your branch)

