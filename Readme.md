hobo.rb
========

A quick program to cut out the data from the HOBO datalogger records when the loggers
where actually deployed. The script will attempt to process all csv files in the current diretroy.

To use:

* Edit the control.yaml file to reflect the current deployment. 
* Download the Hobo logger data into the current directory making sure that the id number is the first thing in the Plot Title.
* ruby hobo.rb > collected-data.csv
* ???
* Profit

Prerequisites
-------------

The Plot Title field in the HOBO download needs to start with a space delimited number, which is the
id in the control file. For example:

    Plot Title: 1 Block 1, M4L23

would map to id block 1 in the control file. The remaining data on the plot title is discarded.



