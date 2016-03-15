Travel Insurance Demo Product
=============================

.. csv-table::
   :widths: 50, 50

   "Name", "Travel Insurance Demo Product"
   "Description", "Demo test drive cover"
   "ID", "d8ZYoyL6gBlpnJX9jx4Gkzj1wm7aKrPe"
   "Language", "EN"
   "Region", "All"
   "Live", "No"


Daily Variants - Required Quote Data
------------------------------------
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "date", "Policy start date in ISO 8601", "2016-03-16T14:05:53+01:00"
   "end_date", "date", "Policy end date in ISO 8601", "2016-03-16T14:05:53+01:00"
   "age", "int", "Age of customer", "29"
   "region", "string", "Region for cover", "uk|europe|world"


Annual Variants - Required Quote Data
-------------------------------------
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "date", "Policy start date in ISO 8601", "2016-03-16T14:05:53+01:00"
   "age", "int", "Age of customer", "29"
   "region", "string", "Region for cover", "uk|europe|world"

Optional Extra Data
------------------------
Optional data  appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "addon_snow", "boolean", "Wintersports cover", "true|false"
   "addon_business", "boolean", "Business trip cover", "true|false"
   "addon_cruise", "boolean", "Cruise Cover", "true|false"
   "addon_golf", "boolean", "Golf Cover", "true|false"


Policy Data
-----------

No additional policy data


