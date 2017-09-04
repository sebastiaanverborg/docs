Baloise Smart Device via Webapp
===============================

Product Information
-------------------

.. csv-table::
   :widths: 50, 50

   "Name",     "Handy- & Tabletversicherung"
   "Insurer",  "Baloise"
   "ID",       "RQA8lkzNvBLb0pDbjYDyP16Go3Wwe4qn"
   "Language", "DE"
   "Region",   "Switzerland"

Kasko JS Optional Data Parameters
---------------------------------

Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "product",       "Product",           "1 = Smarthpone, 2 = Tablet"
   "product_price", "Price in CHF",      "500"
   "duration",      "Duration in years", "2"

Example Kasko JS embed code
---------------------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: "<YOUR PUBLIC KEY>",
        product : "RQA8lkzNvBLb0pDbjYDyP16Go3Wwe4qn",
        overlay_color: "#FFFFFF",
        data: {
            quote: {
              "product": "2",
              "product_price": "500",
              "duration": "2"
            }
        }
      });
    </script>



