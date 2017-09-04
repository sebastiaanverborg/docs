REST API
========

Get Quote Request
-----------------

Data fields
~~~~~~~~~~~

Query string data appended to the quote request

.. csv-table::
   :header: "Parameter", "Required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "duration",      "yes", "``string``", "The policy duration in years, accepted values are ``1`` for ``single year`` and ``2`` for ``two years``."
   "product",       "yes", "``string``", "Risk module, accepted values are ``1`` for ``Smartphone`` and ``2`` for ``Tablet``."
   "product_price", "yes", "``string``", "The value of the smart device in CHF, the value must be between ``0`` and ``10000``."

Example Request
~~~~~~~~~~~~~~~

.. code:: bash

    curl https://api.kasko.io/quotes \
        -u <YOUR SECRET API KEY>: \
        -d variant_id=n5l3L4wzQEPJykxv2YxqaBVZR78dvj0o \
        -d data='{"duration":"1","product":"2","product_price":"700"}'

Policy Data Fields
------------------

Create Unpaid Policy Request
----------------------------

Data fields
~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "Required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "use_id",              "yes",         "``bool``",   "Indicates whether device IMEI (for smartphone) or serial number (for tablet) will be used."
   "id",                  "conditional", "``string``", "The IMEI of smartphone or serial number of tablet. Required if ``use_id`` is set to ``true``."
   "invoice_number",      "conditional", "``string``", "The receipt number of the device. Required if ``use_id`` is set to ``false``."
   "product_description", "conditional", "``string``", "The name of the product, for example ``iPhone 7`` or ``iPad mini``. Required if ``use_id`` is set to ``false``."
   "gender",              "yes",         "``string``", "Customers gender, accepted values are ``male`` or ``female``."
   "dob",                 "yes",         "``string``", "Customers date of birth in `ISO 8601 <https://en.wikipedia.org/wiki/ISO_8601>`_ format (YYYY-MM-DD)."
   "phone",               "yes",         "``string``", "Customers phone number."
   "home_number",         "yes",         "``string``", "Customers house number."
   "street",              "yes",         "``string``", "Customers street."
   "city",                "yes",         "``string``", "Customers city."
   "postcode",            "yes",         "``string``", "Customers postal code, must be a valid Swiss postal code."

Example Request
~~~~~~~~~~~~~~~

.. code:: bash

    curl https://api.kasko.io/policies \
        -X POST \
        -u <YOUR SECRET API KEY>: \
        -H 'Content-Type: application/json' \
        -d '{
            "quote_token": "<TOKEN OBTAINED FORM QUOTE REQUEST>",
            "first_name": "FirstName",
            "last_name": "LastName",
            "email": "test@kasko.io",
            "data": {
                "use_id": true,
                "id": "IMEI",
                "gender": "female",
                "dob": "1990-12-31",
                "phone": "+41781234567",
                "home_number": "1",
                "street": "Street",
                "city": "City",
                "postcode": "1234"
            }
        }'

Convert Policy To Paid Request
------------------------------

After creating unpaid policy it is required to convert it to paid. This can be done by making another request.

Data fields
~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "Required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "token",     "yes", "``string``", "The ``payment_token`` returned by the create policy request."
   "policy_id", "yes", "``string``", "The 33 character long policy ID returned by the create policy request."

Example Request
~~~~~~~~~~~~~~~

.. code:: bash

    curl https://api.kasko.io/payments \
        -X POST \
        -u <YOUR SECRET API KEY>: \
        -H 'Content-Type: application/json' \
        -d '{
            "token": "<PAYMENT TOKEN>",
            "policy_id": "<ID OF THE POLICY>"
        }'
