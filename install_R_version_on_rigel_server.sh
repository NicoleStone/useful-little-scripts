########################################################################
#
#	How to install and run a new version of R on rigel
#
#	20190809 Written by Tara Friedrich and Nicole Stone 
#
########################################################################

########################################################################
#from your home directory on rigel, make a folder for your new R version
########################################################################
mkdir R_version3_6
cd R_version3_6

########################################################################
#now go online and find the version you want:
########################################################################
#http://www.arrayserver.com/wiki/index.php?title=Install_R_locally.pdf#Install_R_locally_on_CentOS
#all versions of R http://cran.rstudio.com/src/base/R-3/

########################################################################
#now grab the version you want, unzip it, and install!
########################################################################
wget http://cran.rstudio.com/src/base/R-3/R-3.6.1.tar.gz
tar xvf R-3.6.1.tar.gz 
cd R-3.6.1
./configure --prefix=//data/home/nstone/R_version3_6/R-3.6.1/ --with-x=no #crucial or errors
make
make install

########################################################################
# TO RUN this local version of R, use:
########################################################################
/data/home/nstone/R_version3_6/R-3.6.1/bin/R


