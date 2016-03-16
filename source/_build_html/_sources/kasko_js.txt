.. _kasko_js:

KASKO JS
========

KASKO JS is used to load and configure the KASKO widget onto your site.
KASKO JS automatically handles sizing of the widget so that it works
responsively in your page.

Before you start this guide you will need :ref:`keys`


Integration KASKO JS
-----------------------

.. code:: html

    <script type="text/javascript" src="https://js.kasko.io"></script>

Include the following JS snippet in the HEAD of the page or at above
where you want the widget to be created.

Widget Containter
--------------------

.. code:: html

    <div id="kasko-widget-container"></div>

Add a container div where you want the widget to be created on the page.

This can be given any ID but we have used kasko-widget-container in our
example below. This container can be set with any width, but should be
left “height:auto” so that KASKO JS can handle the height responsively.

Setup KASKO JS
-----------------

.. code:: html

    <script>
      KASKO.Setup({
        container: "kasko-widget-container",
        key: "TEST OR LIVE CLIENT KEY",
        product : "PRODUCT KEY",
        overlay_color : "#FFFFFF",
        data:{
            classified_id : "Classified ID",
            firstname : "Customer First Name"
        }
      });
    </script>

Below the widget container div include the widget setup javascript

Parameters
~~~~~~~~~~

Widget setup parameters

+------------------+------------+---------------+---------------------------------------------------------+
| Parameter        | required   | Type          | Description                                             |
+==================+============+===============+=========================================================+
| container        | yes        | string        | ID of the div you want the KASKO Widget to appear in.   |
+------------------+------------+---------------+---------------------------------------------------------+
| key              | yes        | string        | TEST or LIVE client key provided by KASKO.              |
+------------------+------------+---------------+---------------------------------------------------------+
| product          | yes        | string        | Product key provided by KASKO.                          |
+------------------+------------+---------------+---------------------------------------------------------+
| overlay\_color   | no         | string        | HEX Color code of the loading overlay.                  |
+------------------+------------+---------------+---------------------------------------------------------+
| data             | no         | data object   | Data                                                    |
+------------------+------------+---------------+---------------------------------------------------------+

Optional data parameters
~~~~~~~~~~~~~~~~~~~~~~~~

These fields can be provided to the data object.

These fields can prepopulate widget data or be used to pass extra information



+------------------+---------------+-----------------------------------------------------------------------------------------+
| Parameter        | Type          | Description                                                                             |
+==================+===============+=========================================================================================+
| firstname        | string        | Firstname of the customer - This will prepopulate in the widget                         |
+------------------+---------------+-----------------------------------------------------------------------------------------+
| lastname         | string        | Lastname of the customer - This will prepopulate in the widget                          |
+------------------+---------------+-----------------------------------------------------------------------------------------+
| email            | string        | Email Address of the customer - This will prepopulate in the widget                     |
+------------------+---------------+-----------------------------------------------------------------------------------------+
| registration     | string        | Registration plate of the car the policy is for - This will prepopulate in the widget   |
+------------------+---------------+-----------------------------------------------------------------------------------------+
| classified_id    | string        | ID of the classified advert for the car of the policy                                   |
+------------------+---------------+-----------------------------------------------------------------------------------------+


Testing
----------

Once the Widget is working in TEST mode, you can buy a policy with the
following CC details

+----------------------+--------------------------+
| Field                | Detail                   |
+======================+==========================+
| Credit Card Number   | 4111 1111 1111 1111      |
+----------------------+--------------------------+
| CVC                  | 123                      |
+----------------------+--------------------------+
| Exp                  | 12/19                    |
+----------------------+--------------------------+
| Name                 | Any name above 4 chars   |
+----------------------+--------------------------+

Please contact techsupport@kasko.io with the URL of your page for us to
check the integration

Go Live
----------

When testing is complete and you're ready to Go Live, please swap the
Client TEST key for the Client LIVE key in your production site.

.. note:: You must swap you client key with the LIVE client key before going live.
