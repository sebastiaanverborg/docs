Travel Insurance ERV Products
==============================

PackageHealth (German)
----------------------

.. csv-table::
   :widths: 50, 50

   "Name", "PackageHealth"
   "Description", "PackageHealth"
   "ID", "xxx"
   "Language", "DE"
   "Region", "Europe/Worldwide"
   "Live", "No"

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

--------------------------------------------------------------------------------

Cancel (German)
---------------

.. csv-table::
   :widths: 50, 50

   "Name", "Cancel"
   "Description", "Cancel"
   "ID", "xxx"
   "Language", "DE"
   "Region", "All"
   "Live", "No"

Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_assured", "int", "Number of travelers", "2"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"
   "travelers.*.first_name", "string", "Array of traveler first names", "John"

--------------------------------------------------------------------------------

Package (French)
----------------

.. csv-table::
   :widths: 50, 50

   "Name", "Package"
   "Description", "Package"
   "ID", "xxx"
   "Language", "FR"
   "Region", "All"
   "Live", "No"

Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_assured", "int", "Number of travelers", "2"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"
   "travelers.*.first_name", "string", "Array of traveler first names", "John"

--------------------------------------------------------------------------------

Cancel (French)
---------------

.. csv-table::
   :widths: 50, 50

   "Name", "Cancel"
   "Description", "Cancel"
   "ID", "xxx"
   "Language", "FR"
   "Region", "All"
   "Live", "No"

Quote Data
^^^^^^^^^^
Query string data appended to the quote request

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "trip_price", "int", "Trip price in cents", "20000"
   "number_of_assured", "int", "Number of travelers", "2"


Policy Data
^^^^^^^^^^^
JSON data posted to /policies on creation of policy

.. csv-table::
   :header: "Name", "Type", "Description", "Example Value"
   :widths: 20, 20, 80, 20

   "start_date", "string", "Trip start date", "01/12/2016 00:00:00"
   "end_date", "string", "Trip end date", "09/12/2016 00:00:00"
   "travelers.*.first_name", "string", "Array of traveler first names", "John"
