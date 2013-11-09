INSTALLATION:
   Pull the repo to your local machine, into a directory called read_grib.
The files can be left here and the path to read_grib included in the startup.m
file.  

COMPILATION:
   There is now only 1 mex file, written in c, that needs to be compiled.   Fire up
MATLAB, cd to the read_grib/private directory and type the following:

   >> mex BDS_unpack_mex5.c

All should go well, assuming you have a MATLAB-supported c compiler.  This 
code is known to work on Linux, DEC-alpha, IBM, SGI, and MACs. The code is 
standard, and should work on most other platforms.  Binaries are available 
for some platforms, and are in the git repo.

