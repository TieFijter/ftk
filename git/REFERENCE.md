# Common Git things

## Renaming a branch

1. Do this in the webUI
2. Run the below locally:

```.sh
git branch -m feature/v1 main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```
