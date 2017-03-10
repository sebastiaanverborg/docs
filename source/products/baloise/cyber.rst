Cyber
===================

Product Information
-------------------

.. csv-table::
   :widths: 50, 50

   "Name", "Cyber"
   "Insurer", "Balose"
   "ID DE", "L14J5Za9VRe7yjDaVrXzWwmpBO0AkKor"
   "ID FR", "WKLe03JjQRwmZzDYAzD7Ob4NPlk8rpyv"
   "ID IT", "wQKOzW9P5omVBexzA4XqdE6r48LA3GYN"
   "Language", "DE|FR|IT"
   "Region", "Switzerland"

Kasko JS Optional Data Parameters
-------------
Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "product",  "Safe Pay, Safe Surf, Surf & Pay", "1|2|3"
   "family",  "Single, Family", "1|2"
   "duration",  "Duration in years", "1|2"

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
              'product' : 2,
              'family' : '2'
              'duration' : '2'
            }
        }
      });
    </script>



