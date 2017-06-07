Holiday
===================

Product Information
-------------------

.. csv-table::
   :widths: 50, 50

   "Name", "Holiday"
   "Insurer", "Baloise"
   "ID DE", "pJeQgLmKblzBR6x5poX5vdqEkV3wP7an"
   "ID FR", "L14J5Za9VRe7yjDadlMzWwmpBO0AkKor"
   "ID IT", "LPE5mgGpndOQZoX7j5Dze0w8aK7Br3N1"
   "Language", "DE|FR|IT"
   "Region", "Switzerland"

Kasko JS Optional Data Parameters
-------------
Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "luggage_value",  "The value of luggage. Increments of 1000 starting from 0, up to 20000", "0, 1000, 2000, .., 20000"
   "reduced_excess",  "Boolean of whether reduced excess is included", "true | fase"

Example Kasko JS embed code
-------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: "KEY",
        product : "pJeQgLmKblzBR6x5poX5vdqEkV3wP7an",
        mode: "fullscreen",
        data: {
          luggage_value: 3000,
          reduced_excess: true
        }
      });
    </script>
