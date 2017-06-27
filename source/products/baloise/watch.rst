Watch
===================

Product Information
-------------------

.. csv-table::
   :widths: 50, 50

   "Name", "Watch"
   "Insurer", "Baloise"
   "ID DE", "g9rVJqB3lE15zoXLmJxK8kbp0RmZOW6Q"
   "ID IT", "zG13lWZ8KQykqaXwyOMNPAb6w7VOYdve"
   "ID FR", "KJAR5gL1GY0j6QDG58x72z3v9yoO8VkB"
   "Language", "DE|FR|IT"
   "Region", "Switzerland"

Kasko JS Optional metadata Parameters
-------------------------------------
Optional data that can be put in the "metadadata" tag of the kasko embed object

.. csv-table::
   :header: "Name", "Description", "Example Value"

   "salesagentid",  "The string ID of the sales agent.", "123456789"

Example Kasko JS embed code
---------------------------

.. code:: html

    <script>
      Kasko.Setup({
        container: "kasko-widget-container",
        key: "KEY",
        product : "g9rVJqB3lE15zoXLmJxK8kbp0RmZOW6Q",
        mode: "fullscreen",
        metadata: {
          salesagentid: 123456789
        }
      });
    </script>
