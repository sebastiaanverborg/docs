.. _keys:

Keys
====

Client Keys
~~~~~~~~~~~

KASKO will provide you with two Client keys: **TEST** and **LIVE**.

**TEST** key is for development purposes using test credit card
credentials without real charges being made or insurance policies being
created.

**LIVE** key is to create real policies. Credit card information will be
processed, charges will be made and real insurance policies will be
created.

Secret Keys
~~~~~~~~~~~

KASKO will provide you with two Secret keys to be used with the KASKO REST API.

**TEST** key is for development purposes without real insurance policies being created.

**LIVE** key is to create real policies. Once the distributor confirms that payment has been received real insurance policies will be
created.

.. warning::
	Secret keys must be stored securely as they allowing issuing of policies
	for which payment will be owed by the distributor

	If you are concerned about the security of one of your secret keys
	please contact support@kasko.io immediately and we will rotate the key

Product Keys
~~~~~~~~~~~~

KASKO will provide you with distinct product keys for each insurance
product that you have access to.

This key must be provided to the KASKO JS and REST API respectively.