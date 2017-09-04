Webapp
======

KASKO JS Data Parameters
------------------------

Optional data that can be put in the ``data`` tag of the KASKO embed object.

.. csv-table::
   :header: "Name", "Required", "Type", "Description", "Example Value"

   "product",  "``no``", "`string`", "Safe Pay, Safe Surf, Surf & Pay", "``1`` - Safe pay, ``2`` - Safe surf, ``3`` - Safe pay & surf."
   "family",   "``no``", "`string`", "Single, Family",                  "``1`` - single, ``2`` - family."
   "duration", "``no``", "`string`", "Duration in years",               "``1`` - single year, ``2`` - two years."

Example KASKO JS embed code
---------------------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: "<PUBLIC KEY>",
        product: "L14J5Za9VRe7yjDaVrXzWwmpBO0AkKor",
        overlay_color: "#FFFFFF",
        data: {
          quote:{
            product: "2",
            family: "2"
            duration: "2"
          }
        }
      });
    </script>



