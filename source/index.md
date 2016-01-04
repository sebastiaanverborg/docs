---
title: Kasko Developer Documentation

language_tabs:


toc_footers:
  - <a href='mailto:techsupport@kasko.io?subject=Kasko%20API%20Key'>Contact us for a Developer Key</a>
  - Copyright &copy; 2015. All rights reserved.

includes:

search: true
---

# Introduction

Welcome to the Kasko documentation.

In this guide we start from the simplest integration possible the Kasko JS, and then explain how you directly embed the Kasko iframe if you need to embed the Widget in places where Kasko JS would not be supported.

The easiest and recommended way to integrate with Kasko is using the Kasko JS Widget, but you can always fall back to direct iframe integration or our REST API if want a more complex integration.

We are always happy to hear from our users, so if you have any feedback or suggestions please <a href="mailto:techsupport@kasko.io">email our technical support desk</a>.

# Keys

### Client Keys

Kasko will provide you with two Client keys: **TEST** and **LIVE**.

**LIVE** key will only return and create real polices.   The Credit card entered will be charged, and a real policy will be created.

**TEST** key is for development purposes and will create and return policies for development purposes.  Only specific credit card details can be used, and no real card will be charged.

### Product Keys

Kasko will provide you with Product keys for all insurance products you have access too.

This key must be provided to the Kasko JS.

# Kasko JS

Kasko JS is the easiest way to integrate the Kasko Widget on your page responsively.

## 1. Integration Kasko JS

``` html
<script type="text/javascript" src="https://js.kasko.io"></script>
```

Include the following JS include in the HEAD of the page or at above where you want the widget to be created.

## 2.  Widget Containter

``` html
<div id="kasko-widget-container"></div>
```

Include a container div where you want the widget to be created on the page.  This can be given any id but we have used kasko-widget-container in our example below.

## 3.  Setup Kasko JS

``` html
<script>
  Kasko.Setup({
    container: "kasko-widget-container",
    key: 'TEST OR LIVE CLIENT KEY',
    product : 'PRODUCT KEY'
  });
</script>
```

Below the widget container div include the widget setup javascript

### Mandatory fields

Parameter | Type | Description
--------- | ---- | -----------
container | div-id | ID of the div you want the Kasko Widget to appear in.
key | client key | TEST or LIVE client key provided by Kasko.
product | product key | Insurance product key provided by Kasko.


## 4. Testing
Please contant <a href="mailto:techsupport@kasko.io">techsupport@kasko.io</a> with the URL of your page for us to check the integration

## 5. Go Live
When testing is complete and you're ready to Go Live, please swap the Client TEST key for the Client LIVE key in your production site.

<aside class="notice">
You must swap you client key with the live client key before going live.
</aside>

# IFrame integration

We strongly suggest using the Kasko JS method, as this script deals with making the widget responsive.

If you cannot use our kasko script include please contact <a href="mailto:techsupport@kasko.io">techsupport@kasko.io</a> who will assist you with embedding the iframe directly correctly.

# REST API

Our REST API can be used for advanced integrations and hybrid integrations.  Please contact <a href="mailto:techsupport@kasko.io">techsupport@kasko.io</a> for details.


