Webapp
======

Kasko JS Optional Data Parameters
---------------------------------

Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "luggage_value",  "The value of luggage. Increments of 1000 starting from 0, up to 20000", "0, 1000, 2000, .., 20000"
   "reduced_excess",  "Boolean of whether reduced excess is included", "true | fase"

Kasko JS Optional ``metadata`` Parameters
-----------------------------------------

Optional data that can be put in the ``metadadata`` tag of the kasko embed object.

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "salesagentid",  "The ID of the sales agent.", "123456789"

Example Kasko JS embed code
---------------------------

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
        },
        metadata: {
          salesagentid: 123456789
        }
      });
    </script>
