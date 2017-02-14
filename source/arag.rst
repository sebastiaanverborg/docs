ARAG AS24 PUSH API
======================================

This API is used for polocy creation for ARAG

Getting started
---------------

This uses the KASKO push API  and is a single request.

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

	curl -u sk_test_SECRET_KEY: https:/push-api.kasko.io

**Bearer Authentication**

.. code:: rest

	curl -H "Authorization: Bearer sk_test_SECRET_KEY" https://push-api.kasko.io

Header
-------

All requests must be in JSON and include JSON header

.. code:: rest

	-H "Content-Type: application/json"


Create a Policy
--------------------

Definition
~~~~~~~~~~
.. code:: bash

	POST https://push-api.kasko.io/

Parameters
~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "variant_id", "yes", "string", "d2va8Owp4WRnkbMpEWDAmVoN1JejB5GE"
   "input", "yes", "JSON", "JSON - See Product Input"

Product Input
~~~~~~~~~~

.. csv-table::
   :header: "Parameter", "required", "Type", "Description"
   :widths: 20, 20, 20, 80

   "first_name", "yes", "string", "Customer first name"
   "last_name", "yes", "string", "Customer last name"
   "email", "yes", "string", "Customer Email Address"
   "data", "yes", "JSON", "{ 'start_date' : '<DATE IN ISO 8601>' , 'vin' : '<VIN>' }"


Example Request
~~~~~~~~~~~~~~~

.. code:: bash

	curl https://push-api.kasko.io/ \
	    -u sk_test_YE2KUZnp43i9563nY6o46fkz9tadEtMO: \
	    -H "Content-Type: application/json" \
	    -d '{"variant_id":"d2va8Owp4WRnkbMpEWDAmVoN1JejB5GE","input":{"first_name":"Test","last_name":"Person","email":"test@person.com","data":{"start_date":"2017-02-13T10:34:39+00:00","vin":"12345"}}}'

Example Response Success
~~~~~~~~~~~~~~~~

Reference of created policy

response code 200

.. code:: javascript

	{
	  "reference": "97c3b16c-f2d1-11e6-88ad-59f2b961d2ab"
	}

Example Response Failure
~~~~~~~~~~~~~~~~

response code 400

.. code:: javascript

	{
	  "errorMessage": "Bad Request: Missing 'vin'."
	}


If you have any questions please email us at techsupport@kasko.io



