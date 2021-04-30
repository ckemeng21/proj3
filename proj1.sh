#! /bin/bash

PREFIX(){
 num_of_prefix=`expr $1 + 1`
 for j in $(seq 1 $num_of_prefix)
 do
   echo "*" >>$argu3/$argu2
 done
}
 
CYCLING(){
  filelist=`ls`
  for filename in $filelist
  do
    if test -f $filename
    then
      if [ -r "$filename" ]
      then
        PREFIX $depth
        echo "$filename<br>" >>$argu3/$argu2
      fi
    else
      if [ -r "$filename" ]
      then
        PREFIX $depth
        echo "$filename<br>" >>$argu3/$argu2
        cd $filename
        depth=`expr $depth + 1`
        CYCLING
      fi
      cd ..
      depth=`expr $depth - 1`
    fi
  done
}

  argu1="/home"
  argu2="filetree.html"
  argu3=`pwd`
  cd $argu1
  depth=0
  echo "<html>" >>$argu3/$argu2
  echo "<body>" >>$argu3/$argu2
  echo "<hl>PROJECT 1</hl><br>" >>$argu3/$argu2
  echo "<br>" >>$argu3/$argu2
  echo "<hl>$argu1</hl><br>" >>$argu3/$argu2
  CYCLING
  echo "</body></html>" >>$argu3/$argu2

