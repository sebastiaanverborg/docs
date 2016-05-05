Travel Insurance ERV Products
==============================

ERV - Reise
-----------

Product Information
^^^^^^^^^^^^^^^^^^^

.. csv-table::
   :widths: 50, 50

   "Name", "ERV - Reise"
   "Description", "Ihren Urlaub, Ihre Sicherheit!"
   "ID", "LPE5mgGpndOQZoX7eMze0w8aK7Br3N14"
   "Language", "DE"
   "Region", "Europe/Worldwide"
   "Live", "No"

Variants
^^^^^^^^

.. csv-table::
   :widths: 50, 50
   :header: "Variant ID", "Description"

   "LJROpwloaQ8ZBmMA49x7W5PyE4qvAb31", "Reiseschutz"
   "VW9AmkbvRBqZN4xoakDlLgEOry13djnK", "Reiseschutz Plus"


Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_assured", "int", "Number of travelers", "2"
   "georegion", "char", "Travel destination (e for Europe or w for worldwide)", "e"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"
   "travelers.*.first_name", "string", "Array of traveler first names", "John"
   "city", "string", "City", "n/a"
   "street", "string", "Street", "n/a"
   "zipcode", "string", "Zipcode", "n/a"

--------------------------------------------------------------------------------

ERV FR - Reise
--------------

Product Information
^^^^^^^^^^^^^^^^^^^

.. csv-table::
   :widths: 50, 50

   "Name", "ERV FR - Reise"
   "Description", "ERV FR - Reise"
   "ID", "g9rVJqB3lE15zoXLveMK8kbp0RmZOW6Q"
   "Language", "FR"
   "Region", "All"
   "Live", "No"

Variants
^^^^^^^^

.. csv-table::
   :widths: 50, 50
   :header: "Variant ID", "Description"

   "KJAR5gL1GY0j6QDGbrM72z3v9yoO8VkB", "ERV FR Package"
   "d2leL7QmGaOyz4M3RBxPgrkVBEqK6RJZ", "ERV FR Cancelation"

Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_assured", "int", "Number of travelers", "2"
   "georegion", "char", "Travel destination (e for Europe or w for worldwide)", "e"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"
   "travelers.*.first_name", "string", "Array of traveler first names", "John"
   "city", "string", "City", "n/a"
   "street", "string", "Street", "n/a"
   "zipcode", "string", "Zipcode", "n/a"
