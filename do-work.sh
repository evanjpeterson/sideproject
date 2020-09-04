#!/bin/bash

# Oh, boy! Time to crush this side project!
cd ~/source/sideproject

# But wait, how productive are we feeling on a scale of 1-10?
productivity=$(( ($RANDOM % 10) + 1 ))
if (( productivity < 4))
then
  # Yeah, not feeling it, maybe next time.
  exit
fi

# Ugh, but what should we knock out? Maybe sameerkumar18 on github will know:
# https://github.com/sameerkumar18/corporate-bs-generator-api
# (Aside: here's hoping this site remains stable for a while)
commit_msg=`curl https://corporatebs-generator.sameerkumar.website/ | jq '.phrase'`

if [ -n "${commit_msg}" ]
then
  # Uppercase is for suits. Ditto for double quotes.
  commit_msg=`echo "${commit_msg}" | tr '[:upper:]' '[:lower:]' | tr -d '"'`
else
  # When in doubt, always go with "small changes".
  commit_msg='small changes'
fi

# Done! Commit early, commit often, as they say.
git pull
git commit --allow-empty -m "${commit_msg}"
git push
