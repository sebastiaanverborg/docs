Baloise Cyber via PUSH API
==========================

This API is used for creation of Baloise Cyber policies.

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

   "variant_id", "yes", "``string``", "DE: ``9znERVLG5Wwk3dXdR3MBPyJ4vQrpAb0e``, FR: ``LPE5mgGpndOQZoX7j5Dze0w8aK7Br3N1``, IT: ``pJeQgLmKblzBR6x5poX5vdqEkV3wP7an``"
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

   "risk_module", "yes", "``string``", "Risk module, accepted values are ``safe_pay``, ``safe_surf`` or ``safe_pay_and_surf``."
   "family_cover", "yes", "``boolean``", "If set to ``true`` then family cover will be included."
   "policy_duration", "yes", "``string``", "The duration of the policy, accepted values are ``P1Y`` (1 year) or ``P2Y`` (2 years)."
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
              "variant_id": "9znERVLG5Wwk3dXdR3MBPyJ4vQrpAb0e",
              "input": {
                  "first_name":"Test",
                  "last_name":"Person",
                  "email":"test@person.com",
                  "data": {
                      "risk_module": "safe_pay_and_surf",
                      "family_cover": true,
                      "policy_duration": "P1Y",
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
