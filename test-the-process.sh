#!/bin/bash

commit_msg=`curl https://corporatebs-generator.sameerkumar.website/ | jq '.phrase'`

if [ -n "${commit_msg}" ]
then
  echo "$commit_msg"
else
  echo "Small changes"
fi
