



rn=`wgrib eta.grb | grep ":6hr fcst:"  | grep ":UGRD:" | awk -F : '{print $1 }'`

#get U data into text column
wgrib -nh -d $rn -text -o U_6.txt eta.grb 

# similar for V
rn=`wgrib eta.grb | grep "$fcst_string"  | grep ":VGRD:" | awk -F : '{print $1 }'`
wgrib -nh -d $rn -text -o V_6.txt eta.grb  

# paste U,V into 2-col file
paste U_6.txt V_6.txt > UV_6.txt





exit 



#!/bin/bash
# $1 is the command line arg containing the grib file to work on.


if [ $# -ne 1 ] ; then
   echo need grib file name on command line
   exit
fi
	
gribfile=$1

ihr="3 6 9 12"
for i in $ihr; do 

      fcast_string=":$i""hr fcst:"  
      echo $i $fcast_string

#      if [ 0 ] ; then 
#      # get U record number:
      unset rn 
            echo rn = $rn

      rn=`wgrib $gribfile | grep "$fcst_string"  | grep ":UGRD:" | awk -F : '{print $1 }'`
      echo rn = $rn
#      if [ -z $rn ] ; then
		 
#      #get U data into text column
#      wgrib -nh -d $rn -text -o U_$i.txt $gribfile  &> /dev/null 

#      # similar for V
#      rn=`wgrib $1 | grep "$fcst_string"  | grep ":VGRD:" | awk -F : '{print $1 }'`
#      wgrib -nh -d $rn -text -o V_$i.txt $gribfile  &> /dev/null 
				  
#      # paste U,V into 2-col file
#      paste U_$i.txt V_$i.txt > UV_$i.txt

#      else
#      echo  no rec found for $i
#      fi
#      fi
done



