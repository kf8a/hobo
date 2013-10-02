hobo.rb
========

A quick program to cut out the data from the HOBO datalogger records when the loggers
where actually deployed. The script will attempt to process all csv files in the current diretroy.

Prerequisites
-------------

The "include serial number" option needs to be checked in the export options of the hoboware software.

Quick start
------------

1. Edit the control.yaml file to reflect the current deployment. 
2. Download the Hobo logger data into the download directory
3. ruby hobo.rb > collected-data.csv
4. ???
5. Profit

Details
-------

The control.yaml file tells the script what data to cut out and what plots to assign the data to.
The control.yaml file contains an array of serial numbers each with an array of chambers.

