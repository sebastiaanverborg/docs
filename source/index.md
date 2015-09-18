---
title: Kasko API Reference

language_tabs:
  - shell: cURL
  - php: PHP

toc_footers:
  - <a href='mailto:techsupport@kasko.io?subject=Kasko%20API%20Key'>Contact us for a Developer Key</a>
  - Copyright &copy; 2015. All rights reserved.

includes:
  - errors

search: true
---

# Introduction

Welcome to the Kasko API reference. Our API currently provides access to retrieve policy information, but it will be expanded over the coming weeks and months to include endpoints for retrieving products, variants, quotes, and for processing payments.

We have language bindings in cURL and PHP, with more to come soon. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

We are always happy to hear from our users, so if you have any feedback or suggestions please <a href="mailto:techsupport@kasko.io">email our technical support desk</a>.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.kasko.com/api_endpoint_here"
  -H "Authorization: Bearer your_api_key"
```

```php
<?php
  $key = "your_api_key";
    
  curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Bearer $key"));
  curl_setopt($curl, CURLOPT_URL, "https://api.kasko.io/api_endpoint_here");
?>
```

> Make sure to replace `your_api_key` with your API key.

### API Keys

There are two types of API key: **public** and **private**. 

The private key gives you full access to the API and should be used for requests made between your server and the Kasko server. Your private API key carries many privileges, so be sure to keep it secret! 

The public key allows provides you limited access to certain endpoints so that you can use the API from within your website or mobile app. The public key can be placed into javascript code and urls; it doesn't need to be protected like the private key does.

You can manage your API keys from your account [dashboard](https://dashboard.kasko.io). If your private key is compromised then please roll it as soon as possible.

### Authentication mechanism

You authenticate API calls by providing your **secret key** or **public key** in the request. 

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. You must authenticate for all requests.

Authentication to the API occurs via the use of bearer tokens over HTTP/1.1 using Transport Layer Security (TLS). Provide your API key in the Authorization header, e.g.

`Authorization: Bearer your_api_key`

<aside class="notice">
You must replace <code>your_api_key</code> with your API key.<br />
</aside>

For more information on Bearer Tokens and OAuth 2.0 please see [The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://datatracker.ietf.org/doc/rfc6750).

# Versioning

The Kasko API is continually being improved and expanded, but we try to make changes in a way that does not break the contract between us, as a service provider, and you as the API consumer. As such we consider the following changes to be "non-breaking".

* Adding new API endpoints
* Adding new optional request parameters to existing endpoints
* Adding new properties to existing responses
* Changing the order in which properties appear in existing responses
* Changing the length or format of string IDs

We are currently running on one version of the API as we have not made any breaking changes so far. When we need to create a new version we will publish a new URL to our consumers, containing a version number, e.g.

`https://api.kasko.io/v2/api_endpoint_here`

# Pagination

> Paginated responses return JSON structed like this:

```json
{
  "data": [
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {}
  ],
  "meta": {
    "total": 2320,
    "count": 20,
    "limit": 20,
    "sort": "last_name"
  }
}
```
Endpoints that return lists of objects support pagination to ensure performance and efficiency when retrieving data. Pagination controls are expressed as query string parameters in the endpoint URL, e.g.

`https://api.kasko.io/api_endpoint_here?offset=10&limit=100`

Responses on these endpoints split the data and pagnation information into two sections called `data` and `meta` repectively. The `data` section simply contains a single array containing the returned objects. The `meta` section contains the following information:

* The total number of items in the dataset on the server
* The number of items contained in the current response
* The limit on the number of items in the current response
* The sort field and direction (prepend the field with a `-` for descending)

Use the following query string parameters to control the pagination.

Parameter | Type | Default | Description
--------- | ---- | ------- | -----------
<span class="nowrap">`offset`</span> | <span class="nowrap">`integer`</span> | <span class="nowrap">`0`</span> | Inclusive numerical offset index.
<span class="nowrap">`limit`</span> | <span class="nowrap">`integer`</span> | <span class="nowrap">`20`</span> | Maximum number of results to return in the dataset.
<span class="nowrap">`sort`</span> | <span class="nowrap">`string`</span> | <span class="nowrap">`default`</span> | Sort field and direction. The default depends on the endpoint being requested. Multiple sort fields are separated with commas, e.g. `name,-age`

<aside class="notice">
Some endpoints support additional parameters for controlling pagination, and some endpoints may override the above defaults
</aside>

# Rate limiting

We have designed the Kasko API to be scalable and responsive. You should not encounter any rate limit problems with normal use of the API. If you do encounter this error a lot then please <a href="mailto:techsupport@kasko.io">contact us</a> so we can assist you.

# Policies

## The policy object

The policy object represents a purchased policy within Kasko's database. Each policy contains the following information:

* A reference used by the policyholder and insurer - the `insurer_policy_id` 
* The type of product and variant used
* The policyholder's personal information
* The date and time of the policy creation
* The cover period and duration
* The transaction currency, total price paid and the corresponding premium

Attribute | Type | Description
--------- | ---- | -----------
<span class="nowrap">`object`</span> | <span class="nowrap">`string`</span> | String representing the type of the object. The value is "policy".
<span class="nowrap">`insurer_policy_id`</span> | <span class="nowrap">`string`</span> | A policy reference for use by policyholders and insurers.
<span class="nowrap">`insurer_product_name`</span> | <span class="nowrap">`string`</span> | The name of insurance product used by this policy.
<span class="nowrap">`insurer_variant_id`</span> | <span class="nowrap">`integer`</span> | An id of the variant of the insurance product used by this policy.
<span class="nowrap">`kasko_product_id`</span> | <span class="nowrap">`integer`</span> | An id of the Kasko product object used by this policy.
<span class="nowrap">`kasko_variant_id`</span> | <span class="nowrap">`integer`</span> | An id of the Kasko product variant object used by this policy.
<span class="nowrap">`first_name`</span> | <span class="nowrap">`string`</span> | The given name of the policyholder.
<span class="nowrap">`last_name`</span> | <span class="nowrap">`string`</span> | The family name of the policyholder.
<span class="nowrap">`email`</span> | <span class="nowrap">`string`</span> | The email address of the policyholder.
<span class="nowrap">`created_date`</span> | <span class="nowrap">`string`</span> | Policy creation datetime in ISO-8601 format.
<span class="nowrap">`cover_duration_days`</span> | <span class="nowrap">`integer`</span> | Cover duration in number of days.
<span class="nowrap">`cover_start_date`</span> | <span class="nowrap">`string`</span> | Cover start datetime in ISO-8601 format.
<span class="nowrap">`cover_end_date`</span> | <span class="nowrap">`string`</span> | Cover end datetime in ISO-8601 format.
<span class="nowrap">`currency`</span> | <span class="nowrap">`string`</span> | Currency code of the policy quote and subsequent transaction in ISO-4217 format.
<span class="nowrap">`price`</span> | <span class="nowrap">`integer`</span> | Total price paid by policyholder, expressed in the minor unit of the currency used, or the major unit if the currency has only one.
<span class="nowrap">`gross_premium`</span> | <span class="nowrap">`integer`</span> | Gross premium of the policy expressed in the minor unit of the currency used, or the major unit if the currency has only one.

## Get all policies

```shell
curl "https://api.kasko.io/policies" \
 -H "Authorization: Bearer your_api_key";
```

```php
<?php
  $key = "your_api_key";

  $curl = curl_init();
  curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Bearer $key"));
  curl_setopt($curl, CURLOPT_URL, "https://api.kadsko.io/policies");
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

  if (($result = curl_exec($curl)) === false)
  {
    // hanlde error
  }

  curl_close($curl);
  $policies = json_decode($result);
?>
```

> The API reponse returns JSON structured like this:

```json
{
  "data": [
    {
      "object": "policy",
      "insurer_policy_id": "abc123",
      "insurer_product_name": "Rental Excess Reduction",
      "insurer_variant_id": 1,
      "kasko_product_id": 1,
      "kasko_variant_id": 1,
      "first_name": "Matthew",
      "last_name": "Wardle",
      "email": "mwardle@kasko.io",
      "created_date": "2015-09-02 15:26:45+01:00",
      "cover_duration_days": 1,
      "cover_start_date": "2015-09-03 00:00:00+01:00",
      "cover_end_date": "2015-09-03 23:59:59+01:00",
      "currency": "EUR",
      "price": 615,
      "gross_premium": 462
    },
    {
      "object": "policy",
      "insurer_policy_id": "abc456",
      "insurer_product_name": "Rental Excess Reduction",
      "insurer_variant_id": 1,
      "kasko_product_id": 1,
      "kasko_variant_id": 1,
      "first_name": "Rob",
      "last_name": "Long",
      "email": "rlong@kasko.io",
      "created_date": "2015-09-02 15:31:12+01:00",
      "cover_duration_days": 2,
      "cover_start_date": "2015-09-04 00:00:00+01:00",
      "cover_end_date": "2015-09-06 23:59:59+01:00",
      "currency": "EUR",
      "price": 1185,
      "gross_premium": 924
    }
  ],
  "meta": {
    "total": 2,
    "count": 2,
    "limit": 20,
    "sort": "-created_date"
  }
}
```

This endpoint retrieves all policies.

### HTTP Request

`GET http://example.com/api/policies`

### Query Parameters

In addition to the [standard pagination query parameters](#pagination), the following can be used.

Parameter | Type | Default | Description
--------- | ---- | ------- | -----------
<span class="nowrap">`offset_policy_id`</span> | <span class="nowrap">`string`</span> | <span class="nowrap">`null`</span> | Exclusive `insurer_policy_id` offset. If set, only policies that come after the given id will appear in the result set.

<aside class="success">
Remember to url-encode your `offset_policy_id`
</aside>

### Sorting the results

By default results are sorted by `created_at`

The following fields are available for sorting on this endpoint.

Field |
----- |
<span class="nowrap">`-created_at`</span> |

### Response format

The response is formatted as JSON and contains two sections: one for the `data` and one for the `meta`. 

Two sections are used because this endpoint returns a list of objects that can be paginated using the query string parameters above. The meta section allows you to quickly see the `total` number of results, the `count` of the number of results returned in the current response and the `limit` on response size being used.

## Get a single policy

```shell
curl "https://api.kasko.com/policies/123"
  -H "Authorization: Bearer your_api_key"
```

```php
<?php
  $key = "your_api_key";
  $policyID = 123;

  $curl = curl_init();
  curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Bearer $key"));
  curl_setopt($curl, CURLOPT_URL, "https://api.kadsko.io/policies/$policyID");
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

  if (($result = curl_exec($curl)) === false)
  {
    // hanlde error
  }

  curl_close($curl);
  $policy = json_decode($result);
?>
```

> The above command returns JSON structured like this:

```json
{
  "object": "policy",
  "insurer_policy_id": "abc123",
  "insurer_product_name": "Rental Excess Reduction",
  "insurer_variant_id": 1,
  "kasko_product_id": 1,
  "kasko_variant_id": 1,
  "first_name": "Matthew",
  "last_name": "Wardle",
  "email": "mwardle@kasko.io",
  "created_date": "2015-09-02 15:26:45+01:00",
  "cover_duration_days": 1,
  "cover_start_date": "2015-09-03 00:00:00+01:00",
  "cover_end_date": "2015-09-03 23:59:59+01:00",
  "currency": "EUR",
  "price": 615,
  "gross_premium": 462
}
```

This endpoint retrieves a single policy.

### HTTP Request

`GET http://example.com/policies/{kasko_policy_id}`

or

`GET http://example.com/policies/{insurer_policy_id}`

### URL Parameters

Parameter | Description
--------- | -----------
kasko_policy_id | The `kasko_policy_id` of the policy to retrieve.
insurer_policy_id | The `insurer_policy_id` of the policy to retrieve.

