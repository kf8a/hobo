hobo.rb
========

A quick program to cut out the data from the HOBO datalogger records when the loggers
where actually deployed. The script will attempt to process all csv files in the current diretroy.

Prerequisites
-------------

The "include serial number" option needs to be checked in the export options of the hoboware software.

Quick start
------------

# Edit the control.yaml file to reflect the current deployment. 
# Download the Hobo logger data into the current directory making sure that the id number is the first thing in the Plot Title.
# ruby hobo.rb > collected-data.csv
# ???
# Profit

Details
-------

The control.yaml file tells the script what data to cut out and what plots to assign the data to.
The control.yaml file contains an array of serial numbers each with an array of chambers.

