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
   "number_of_insured", "int", "Number of travelers", "2"
   "georegion", "char", "Travel destination (europe or worldwide)", "europe"
   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20
   "travelers.*.first_name", "string", "Array of traveler first names (excluding the policy holder)", "John"
   "travelers.*.last_name", "string", "Array of traveler last names (excluding the policy holder)", "Doe"
   "streetaddress", "string", "Street address of the policy holder", "Main str. 12"
   "postcode", "string", "Postcode of the policy holder", "12772"

--------------------------------------------------------------------------------

ERV GB - Reise
--------------

Product Information
^^^^^^^^^^^^^^^^^^^

.. csv-table::
   :widths: 50, 50

   "Name", "ERV GB - Reise"
   "Description", "ERV GB - Reise"
   "ID", "WKLe03JjQRwmZzDY6lX7Ob4NPlk8rpyv"
   "Language", "GB"
   "Region", "All"
   "Live", "No"

Variants
^^^^^^^^

.. csv-table::
   :widths: 50, 50
   :header: "Variant ID", "Description"

   "RQA8lkzNvBLb0pDbjYDyP16Go3Wwe4qn", "ERV GB Package"
   "9znERVLG5Wwk3dXdV6MBPyJ4vQrpAb0e", "ERV GB Cancelation"

Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_insured", "int", "Number of travelers", "2"
   "georegion", "char", "Travel destination (europe or worldwide)", "europe"
   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "travelers.*.first_name", "string", "Array of traveler first names (excluding the policy holder)", "John"
   "travelers.*.last_name", "string", "Array of traveler last names (excluding the policy holder)", "Doe"
   "streetaddress", "string", "Street address of the policy holder", "Main str. 12"
   "postcode", "string", "Postcode of the policy holder", "12772"
