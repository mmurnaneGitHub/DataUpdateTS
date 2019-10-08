# CBA Property Information (csv) for TacomaSpace.com
# Download the file from `url` and save it locally under `file_name`:
# Use URL date variable to limit records returned
# Updated: 2019-1-28

import urllib
import logging

#CBA Data Download
url = 'http://www.commercialmls.com/api/SaleLeaseListingsByDate?fields=PropertyId,PropertyType,BuildingTotalSquareFeet,LandTotalSquareFeet,ListingID,ListingType,ListPrice,AskingRent,SquareFeetAvailable,WebRemarks,PropertyName,StreetNumber1,StreetName,City,Latitude,Longitude,PrimaryAgentFirstName,PrimaryAgentLastName,PrimaryAgentPhone,PrimaryAgentEmail&date=12-14-2016&token=dc838ef9-f754-47b8-aee9-066e53d49bc5&format=csv'
#Local file location
file_name = "\\\\wsitd01\\c$\\GADS\\website\\TacomaSpace\\data\CBA_Download.csv"

try:
  # Download data 
  urllib.urlretrieve (url, file_name)
except:
  logging.exception('\n Unexpected error with website, could not download successfully: \n')
else:
  print "CBA download successful!"
