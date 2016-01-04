---
title: KASKO Developer Documentation

language_tabs:


toc_footers:
  - <a href='mailto:techsupport@kasko.io'>Contact us for a Developer Key</a>
  - Copyright &copy; 2015. All rights reserved.

includes:

search: true
---

# Introduction

Welcome to the KASKO documentation.

KASKO support 2 integration methods by default.

### 1. KASKO JS
This integration method is used to load the KASKO Widget onto your site.  The KASKO widget is an end to end solution that will load onto your site and allow the full insurance transaction to take place.

### 2. REST API
The REST API integration method is used for deep integrations.

We are always happy to hear from our users, so if you have any feedback or suggestions please <a href="mailto:techsupport@kasko.io">email our technical support desk</a>.

# Keys

### Client Keys

KASKO will provide you with two Client keys: **TEST** and **LIVE**.

**TEST** key is for development purposes using test credit card credentials without real charges being made or insurance policies being created.

**LIVE** key is to create real policies. Credit card information will be processed, charges will be made and real insurance policies will be created.


### Product Keys

KASKO will provide you with distinct product keys for each insurance product that you have access to.

This key must be provided to the KASKO JS.

# KASKO JS

KASKO JS is used to load and configure the KASKO widget onto your site.  KASKO JS allows handles sizing of the widget so that it works responsively in your page.

## 1. Integration KASKO JS

``` html
<script type="text/javascript" src="https://js.kasko.io"></script>
```

Include the following JS snippet in the HEAD of the page or at above where you want the widget to be created.

## 2.  Widget Containter

``` html
<div id="kasko-widget-container"></div>
```

Add a container div where you want the widget to be created on the page.

This can be given any id but we have used kasko-widget-container in our example below.  This container can be set with any width, but should be left "height:auto" so that KASKO JS can handle the height responsively.

## 3.  Setup KASKO JS

``` html
<script>
  KASKO.Setup({
    container: "kasko-widget-container",
    key: "TEST OR LIVE CLIENT KEY",
    product : "PRODUCT KEY"
  });
</script>
```

Below the widget container div include the widget setup javascript

### Mandatory fields
These fields must be provided for the widget to load

Parameter | Type | Description
--------- | ---- | -----------
container | string | ID of the div you want the KASKO Widget to appear in.
key | string | TEST or LIVE client key provided by KASKO.
product | string | Product key provided by KASKO.

### Optional Fields
These fields can be provided to prepopulate widget data or pass extra information

Parameter | Type | Description
--------- | ---- | -----------
firstname | string | Firstname of the customer - This will prepopulate in the widget
lastname | string | Lastname of the customer - This will prepopulate in the widget
email | string | Email Address of the customer - This will prepopulate in the widget
license_plate | string | License plate of the car the policy is for - This will prepopulate in the widget
classified_id | string | ID of the classified advert for the car of the policy


## 4. Testing

Once the Widget is working in TEST mode, you can buy a policy with the following CC details

Field | Detail
--------- | ------
Credit Card Number | 4111 1111 1111 1111
CVC | 123
Exp | 12/19
Name | Any name above 4 chars

Please contact <a href="mailto:techsupport@kasko.io">techsupport@kasko.io</a> with the URL of your page for us to check the integration

## 5. Go Live
When testing is complete and you're ready to Go Live, please swap the Client TEST key for the Client LIVE key in your production site.

<aside class="notice">
You must swap you client key with the live client key before going live.
</aside>

# REST API

Our REST API can be used for advanced integrations and hybrid integrations.  Please contact <a href="mailto:techsupport@kasko.io">techsupport@kasko.io</a> for details.


