Fernseherversicherung
===================

Product Information
-------------------

.. csv-table::
   :widths: 50, 50

   "Name", "Fernseherversicherung"
   "Insurer", "Balose"
   "ID", "d2va8Owp4WRnkbMpEWDAmVoN1JejB5GE"
   "Language", "DE"
   "Region", "Switzerland"

Kasko JS Optional Data Parameters
-------------
Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "product_price",  "Price in CHF", "500"
   "duration",  "Duration in years", "2"

Example Kasko JS embed code
-------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: 'KEY',
        product : 'd2va8Owp4WRnkbMpEWDAmVoN1JejB5GE',
        overlay_color: "#FFFFFF",
        data: {
            quote:{
              'product_price' : 500,
              'duration' : '2'
            }
        }
      });
    </script>



