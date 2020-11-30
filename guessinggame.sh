#!/usr/bin/env bash
# File: guessinggame.sh

index=0
numfil=$(ls -al | grep ^- | wc -l)

echo " Guess the number of files in the current directory, type it, and press Enter:"
read guess

function validin {
  local reg_ex=^-?[0-9]+$
  if ! [[ $@ =~ $reg_ex ]]; then
    echo "Your entry is invalid. Enter an integer and press Enter:"
    read guess
  elif [[ $guess -eq $numfil ]]; then
    echo "Congratulations, your guess is correct!"
    let index=1
  elif [[ $guess -lt $numfil ]]; then
    echo "Your guess is too low. Try again and press Enter:"
    read guess
  elif [[ $guess -gt $numfil ]]; then
    echo "Your guess is too high. Try again and press Enter:"
    read guess
  fi
}


while  [[ $index -eq 0 ]]
do
  validin $guess
done
