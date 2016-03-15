Creating a Policy
=================


Step 1  - Get Quote
--------------------
Get a quote from the Kasko platform

Parameters
~~~~~~~~~~

+------------------+------------+---------------+---------------------------------------------------------+
| Parameter        | required   | Type          | Description                                             |
+==================+============+===============+=========================================================+
| variant_id       | yes        | string        |  Product key provided by KASKO.                         |
+------------------+------------+---------------+---------------------------------------------------------+
| data             | yes        | JSON          |  refer to the product section here for required data    |
+------------------+------------+---------------+---------------------------------------------------------+

Example Request
~~~~~~~~~~~~~~~

.. code:: rest

	curl "https://dev-api.kasko.io/quotes?data=%7B%22duration%22:1%7D&key=pk_test_pjXOPLyVnNdAbWKAmKrR658MJw7GDEmx&variant_id=d8ZYoyL6gBlpnJX9jx4Gkzj1wm7aKrPe"

Example Response
~~~~~~~~~~~~~~~~

.. code:: javascript

	{
		"gross_premium": 699,
		"currency": "eur",
		"net_premium": 587,
		"net_service_fee_total": 0,
		"premium_tax": 112,
		"service_charge_vat": 0,
		"signature": "2zDDsM+hPro2cDOhEqj7RuwJzcxcwC\/YgG2Wim13AFLaQXqhAL7hPDFTm5qhGV9wWm9dwinvcd44DnB22v6D1oYQmvM18MrKZtQZzoGb1Qtn8cH90ZIaKeywrxyNopZFOgw61PBbF74qo4Z1E4LKrbjEVl8fD9OJXcukDnC2\/r7Yi7KkEIGhKkBUyjn4LMlupi6rfpMUjRtx73f5WWin8lGJTGRIdcJGZKArE53wVZZKIRt230ee6ZXUOkGlPkKD7iJ15qOTCmKeoeaYY8+h59WT2Vmm6HSlljTuu11\/a1nwLz9rjmYIN9GOewQKuWXW0gL1xUuJh0cmGd8rMBjZ74FlhS59YxkSUzJJ4bsfE6cmcRXylBdb6iMG5WDryN4hpaTs8gqx9O8iphCTfpRox0l1LNYjJWdX7gaFHYkW7ZeI8HsFQs\/Dc4QYTfOTud6Xzu5k25Ae51z\/AOyNZBk0T3RSByYnKFzv\/czm19UzbdPU="
	}

Step 2 - Create a policy (Step 1)
---------------------------------
Create an unpaid policy on the Kasko platform.

Why do we do this 2 step mechanism?   We want to ensure that there is no problem with the quote or details before you charge your customers for the policy.  After this point we can ensure that the policy can be purchased.

+------------------+------------+---------------+---------------------------------------------------------+
| Parameter        | required   | Type          | Description                                             |
+==================+============+===============+=========================================================+
| quote_token      | yes        | string        |  Quote token provided in quote object                   |
+------------------+------------+---------------+---------------------------------------------------------+
| first_name       | yes        | string        |  First Name of the customer                             |
+------------------+------------+---------------+---------------------------------------------------------+
| last_name        | yes        | string        |  Last Name of the customer                              |
+------------------+------------+---------------+---------------------------------------------------------+
| email            | yes        | string        |  Email address of the customer                          |
+------------------+------------+---------------+---------------------------------------------------------+
| data             | maybe      | JSON          |  refer to the product section here for required data    |
+------------------+------------+---------------+---------------------------------------------------------+

Example Request
~~~~~~~~~~~~~~~

.. code:: rest

	curl 'https://dev-api.kasko.io/policies' \
   	-H 'Content-Type: application/json;charset=UTF-8' \
   	-H 'Authorization: Bearer sk_test_eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJKK1gwNkc4VDdwTFhQNjlyNmUyNCIsImlhdCI6MTQ1NjE0Mjk4MiwiZXhwIjo5OTk5OTk5OTk5LCJpc3MiOiJLYXNrbyIsIm93bmVyIjoiYTIzIiwiYWNjb3VudCI6MjMsInR5cGUiOiJkaXN0cmlidXRvciIsInJvbGUiOiJhZG1pbiIsImxpdmVtb2RlIjpmYWxzZX0.Lm8EHXBSrLTmr8o0QAvnhbu1aiiCfJRZ5vl2cduu5OY' \
   	-H 'Connection: keep-alive' \
   	--data-binary '{"quote_token":"0kiJgJpa9t8PjRMGNWhyHRQkqaUaehLV9nL4aUpGbefpphSRDFsG2BNmLl0sfVcXwH2v+se2BRx0E0NfEN0Lsc1M9NJg8g\/1wxBNw8RJHcqmRhwsBc2G6oFydpA5dR562543qv+DHwqjAlqwLO5rYh6iaqE0MdARU4RH9yJMxExdkk+\/K+gOGUyaxjMsgLk+jcB5wHqXOq3QIVzeSssGMfPmWQiTwarh4z02GZgqoE2IilSYjdLTMcduJkQwgGmTBVB5n+RfaxGg7bn6WqwkOciEGHsEmK3LB5ItnDuwiiy5weDW9LceYShuoSPmW8tsimHiFxTSpPgVPwWK6ojUR7dM5vrIDPBoj4N9E\/zJe\/0fRmoYG6IeKA2uClVqFrnZ4BSMyjM6Ierv11wJj6M1tMcnfdGuo0WHMMiJ3pACIDFtJa81WwZe7sUqgN1esAm0SsTjg5qgJ4MuxNghqFgwIOIJgp8yHQU6Mj7QFbARL9ric+hBVHd12qIQyp0MPgZjqo+1YNraUAXXAB0tCtCOUzwPVmGgeebS9\/u+4p+A4ubmdC7xlo0JTOyBj+GCxVzex1rkWwPQmxQzMNZDij1EWDjp2Jf2+MpdxDoFIKpsZEd\/xfrCDOZNDiCY7vfr90B+w","first_name":"Matthew","last_name":"Wardle","email":"mwardle@kasko.io","data":{"registration":"mm-123"}}'


Example Response
~~~~~~~~~~~~~~~~

.. code:: javascript

	{
	  "id": "tDd0oL9AJZV5B6kPOMXa2mG4qgN3WbYpX",
	  "variant_id": "d8ZYoyL6gBlpnJX9jx4Gkzj1wm7aKrPe",
	  "insurer_policy_id": "PROBE-0726E",
	  "duration_purchased": "P1D",
	  "duration_remaining": "P1D",
	  "purchased_at": "2016-02-22T19:38:00+00:00",
	  "expires_at": "2016-03-18T23:59:59+00:00",
	  "activations": [

	  ],
	  "product_id": "",
	  "gross_premium": 699,
	  "language": null,
	  "data": {
	    "registration": "mm-123"
	  },
	  "_links": {
	    "_self": {
	      "href": "https:\/\/dev-api.kasko.io\/policies\/tDd0oL9AJZV5B6kPOMXa2mG4qgN3WbYpX"
	    },
	    "activations": {
	      "href": "https:\/\/dev-api.kasko.io\/policies\/tDd0oL9AJZV5B6kPOMXa2mG4qgN3WbYpX\/activations"
	    }
	  }
	}



Step 3 - Trigger the policy has been paid.
------------------------------------------
