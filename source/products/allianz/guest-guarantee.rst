Allianz Guest Guarantee PUSH API
======================================

This API is used for creation of Allianz Guest Guarantee policies.

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

   "variant_id", "yes", "string", "d7zoBRlEp9yar6XyrjxPWm05VqwkQKA8"
   "input", "yes", "JSON", "JSON - See Product Input."

Product Input
~~~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "first_name", "yes", "string", "Customer first name."
   "last_name", "yes", "string", "Customer last name."
   "email", "yes", "string", "Customer Email Address."
   "data", "yes", "JSON", "JSON - See Policy Data Input."

Policy Data Input
~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "checkin_date", "yes", "string", "Check-in date in `ISO 8601 <https://en.wikipedia.org/wiki/ISO_8601>`_ format (YYYY-MM-DD). Must be greater than or equal to todays date."
   "checkout_date", "yes", "string", "Check-out date in `ISO 8601 <https://en.wikipedia.org/wiki/ISO_8601>`_ format (YYYY-MM-DD). Must be greater than or equal to check-in date."
   "sum_insured", "yes", "string", "The sum insured in cents. Allowed values are 100000, 200000, 300000"
   "street", "yes", "string", "Customers street."
   "house_number", "yes", "string", "Customers house number."
   "postcode", "yes", "string", "Customers postal code."
   "city", "yes", "string", "Customers city."
   "country", "yes", "string", "Customers country."

Example Request
~~~~~~~~~~~~~~~

.. code:: bash

	curl https://push-api.kasko.io/ \
	    -u <YOUR SECRET API KEY>: \
	    -H "Content-Type: application/json" \
	    -d '{"variant_id":"d7zoBRlEp9yar6XyrjxPWm05VqwkQKA8","input":{"first_name":"Test","last_name":"Person","email":"test@person.com","data":{"checkin_date":"2017-07-05","checkout_date":"2017-07-05","sum_insured":"200000","street":"2nd Avenue","house_number":"123","postcode":"UX XXX","city":"Atlantis","country":"Noland"}}}'

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
	  "errorMessage": "Bad Request: Missing 'first_name'."
	}


If you have any questions please email us at ``techsupport@kasko.io``.
