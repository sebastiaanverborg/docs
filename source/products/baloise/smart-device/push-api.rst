Baloise Smart device via PUSH API
=================================

This API is used for creation of Baloise Smartphone/Tablet policies.

Getting started
---------------

This uses the KASKO push API and is a single request.

1) Make POST request to URL

Authentication
--------------

Authenticate your account when using the API by including your secret API :ref:`key <keys>` in the request. Your API keys carry many privileges, so be sure to keep them secret! Do not share your secret API keys in publicly accessible areas such GitHub, client-side code, and so forth.

Requests that require authentication will return ``404 Not Found``, instead of ``403 Forbidden``, in some places. This is to prevent the accidental leakage of sensitive data to unauthorized users.

Authentication to the API is performed via `HTTP Basic Auth <https://en.wikipedia.org/wiki/Basic_access_authentication>`_. Provide your API key as the basic auth username value. You do not need to provide a password.

If you need to authenticate via bearer auth (e.g., for a cross-origin request), use ``-H "Authorization: Bearer sk_test_SECRET_KEY"`` instead of ``-u sk_test_SECRET_KEY:``.

All API requests must be made over `HTTPS <https://en.wikipedia.org/wiki/HTTPS>`_. Calls made over plain HTTP will fail.

**Basic Authentication**

.. code:: rest

	curl -u sk_test_SECRET_KEY: https://push-api.kasko.io/

**Bearer Authentication**

.. code:: rest

	curl -H "Authorization: Bearer sk_test_SECRET_KEY" https://push-api.kasko.io/

Header
------

All requests must be in JSON and include ``Content-Type`` header.

.. code:: rest

	-H "Content-Type: application/json"


Create a Policy
---------------

Definition
~~~~~~~~~~
.. code:: bash

	POST https://push-api.kasko.io/

Parameters
~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "variant_id", "yes", "``string``", "DE: ``n5l3L4wzQEPJykxv2YxqaBVZR78dvj0o``, FR: ``wQKOzW9P5omVBexzGYMqdE6r48LA3GYN``, IT: ``WKLe03JjQRwmZzDYyjD7Ob4NPlk8rpyv``"
   "input", "yes", "``object``", "JSON - See Product Input."

Product Input
~~~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "first_name", "yes", "``string``", "Customer first name."
   "last_name", "yes", "``string``", "Customer last name."
   "email", "yes", "``string``", "Customer Email Address."
   "data", "yes", "``object``", "JSON - See Policy Data Input."
   "metadata", "no", "``object``", "Key/value pairs of arbitrary metadata that can be provided by the user."

Policy Data Input
~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "device_type", "yes", "``string``", "The type of device being insured, accepted values are ``smartphone`` or ``tablet``."
   "policy_duration", "yes", "``string``", "The duration of the policy, accepted values are ``P1Y`` (1 year) or ``P2Y`` (2 years)."
   "device_value", "yes", "``int``", "Device value in cents, the value must be an intger between ``1`` and ``1000000``."
   "imei", "no", "``string``", "IMEI of the smartphone. This field can only be used when the value of ``device_type`` field is set to ``smartphone``. If this field is used, then ``product_name`` and ``receipt_number`` fields must be omitted."
   "serial_number", "no", "``string``", "Serial number of the tablet. This field can only be used when the value of ``device_type`` field is set to ``tablet``. If this field is used, then ``product_name`` and ``receipt_number`` fields must be omitted."
   "product_name", "no", "``string``", "The name of the device being insured. If this field is used, then ``receipt_number`` is required and either ``imei`` or ``serial_number`` fields must be omitted."
   "receipt_number", "no", "``string``", "Receipt number. If this field is used, then ``product_name`` is required and either ``imei`` or ``serial_number`` fields must be omitted."
   "salutation", "yes", "``string``", "Customers salutation, accepted values are ``mr`` or ``ms``."
   "dob", "yes", "``string``", "Customers date of birth in `ISO 8601 <https://en.wikipedia.org/wiki/ISO_8601>`_ format (YYYY-MM-DD)."
   "phone", "yes", "``string``", "Customers phone number."
   "house_number", "yes", "``string``", "Customers house number."
   "street", "yes", "``string``", "Customers street."
   "city", "yes", "``string``", "Customers city."
   "postcode", "yes", "``string``", "Customers postal code."

Example Request
~~~~~~~~~~~~~~~

.. code:: bash

    curl https://push-api.kasko.io/ \
        -u <YOUR SECRET API KEY>: \
        -H "Content-Type: application/json" \
        -d '{
              "variant_id": "n5l3L4wzQEPJykxv2YxqaBVZR78dvj0o",
              "input": {
                  "first_name":"Test",
                  "last_name":"Person",
                  "email":"test@person.com",
                  "data": {
                      "device_type": "smartphone",
                      "policy_duration": "P1Y",
                      "device_value": 50000,
                      "product_name": "iPhone 7",
                      "receipt_number": "123456789",
                      "salutation": "mr",
                      "dob": "1989-02-04",
                      "phone": "0781234567",
                      "house_number": "1",
                      "street": "2nd Avenue",
                      "city": "Atlantis",
                      "postcode": "1234"
                  },
                  "metadata": {
                    "some": "value"
                  }
              }
          }'

Example Response Success
~~~~~~~~~~~~~~~~~~~~~~~~

Reference of created policy

response code 200

.. code:: javascript

	{
	  "reference": "97c3b16c-f2d1-11e6-88ad-59f2b961d2ab"
	}

Example Response Failure
~~~~~~~~~~~~~~~~~~~~~~~~

response code 400

.. code:: javascript

	{
	  "errorMessage": "Bad Request: The 'first_name' field is required."
	}


If you have any questions please email us at ``techsupport@kasko.io``.
