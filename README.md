# read_grib
=========

##read_grib is a WMO GRiB Edition 1 file reader for MATLAB

Current Version: r4 (10 March 2013)

##NOTE RE: Grib2 files

read_grib does NOT read grib2 files, and there is no chance that it will. It is much easier to do one of two things:

1. Use nctoolbox, available on GitHub at https://github.com/nctoolbox/nctoolbox.git. This is the simplest way.
2. Convert grib2 to netCDF with wgrib2 and use MATLAB's netCDF interface to get into MATLAB.


##Summary

###INSTALLATION
   Pull the repo to your local machine, into a directory called read_grib.
The files can be left here and the path to read_grib included in the startup.m
file.  

###COMPILATION
   There is 1 mex file, written in c, that needs to be compiled.   Fire up
MATLAB, cd to the read_grib/private directory and type the following:

    mex BDS_unpack_mex5.c

All should go well, assuming you have a MATLAB-supported c compiler.  This 
code is known to work on Linux, DEC-alpha, IBM, SGI, and MACs. The code is 
standard, and should work on most other platforms.  Binaries are available 
for some platforms, and are in the git repo.


###Usage

READ_GRIB reads WMO international exchange GRiB formatted data files into MATLAB.
It has various input modes, including extraction of individial GRiB records by record number, 
extraction by parameter name (which is not unique), and generating an inventory of the GRiB 
file contents.  It has been tested on the following standard model output files: AVN, ETA, RUC, 
ECMWF, and WAM.  The default GRiB parameter table used is the NCEP Operational table.

Calls to read_grib look like:

    grib_struct=read_grib(gribname,irec,p1,v1,p2,v2,...);

For example:

    grib_struct=read_grib(gribname,irec,'HeaderFlag',0,'ParamTable','ECMWF128');

The first 2 arguments are required:

1. <strong>gribname </strong>- filename containing GRiB records.
2. <strong>irec</strong> - specifies which GRiB records to read.
                  If irec is a vector, it specifies which GRiB records to return.
                  If irec is a scalar, is specifies how far to read into the GRiB file.
                  If irec==-1, READ_GRIB reads all records(default). 
                  Irec can be a cell array of parameter names to extract.  
                  Type read_grib('paramtable') for a list of parameter names. 
                  Irec can also be the string 'inv{entory}', so that READ_GRIB prints a GRiB contents
 list.


