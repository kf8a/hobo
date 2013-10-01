hobo.rb
========

A quick program to cut out the data from the HOBO datalogger records when the loggers
where actually deployed. To use:

* Edit the control.yaml file to reflect the current deployment. 
* Download the Hobo logger data into the current directory making sure that the id number is the first thing in the Plot Title.
* ruby hobo.rb > collected-data.csv
* ???
* Profit
