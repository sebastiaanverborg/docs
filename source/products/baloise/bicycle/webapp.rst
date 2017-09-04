Webapp
======

Kasko JS Optional Data Parameters
---------------------------------
Optional data that can be put in the "data" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "product",       "Product",           "``1`` - Bicycle, ``2`` - Electric bicycle"
   "product_price", "Price in CHF",      "500"
   "duration",      "Duration in years", "2"

Example Kasko JS embed code
---------------------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: "KEY",
        product : "d7zoBRlEp9yar6XyQBXPWm05VqwkQKA8",
        overlay_color: "#FFFFFF",
        data: {
            quote: {
              product: "2",
              product_price: 500,
              duration: "2"
            }
        },
        metadata: {
          salesagentid: "123456789"
        }
      });
    </script>
