read_grib
=========

Grib Edition 1 reader for MATLAB

read_grib r4 (10 March 2013)
a WMO GRiB Edition 1 file reader for MATLAB

CONTACT:brian_blanton@renci.org
LAST MODIFIED: 16 Apr 2012

NOTE RE: Grib2 files

read_grib does NOT read grib2 files, and there is no possibility that it will. It is much easier to do one of two things:
Use (nctoolbox). This is the simplest way.
Convert grib2 to netCDF with wgrib2 and use MATLAB's netCDF interface to get into MATLAB.

