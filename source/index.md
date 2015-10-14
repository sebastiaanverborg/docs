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

We have language bindings in cURL with more to come soon. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

KASKO API response payload is in the HAL format.  For more information on HAL format please look <a href="http://stateless.co/hal_specification.html">here</a>

We are always happy to hear from our users, so if you have any feedback or suggestions please <a href="mailto:techsupport@kasko.io">email our technical support desk</a>.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.kasko.io/api_endpoint_here"
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


We use two classes of API keys.  TEST and LIVE.

LIVE key will only return and create real polices

TEST key is for development purposes and will create and return policies for DEV purposes.

### Authentication mechanism

You authenticate API calls by providing your **secret key** or **public key** in the request.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. You must authenticate for all requests.

Authentication to the API occurs via the use of bearer tokens over HTTP/1.1 using Transport Layer Security (TLS). Provide your API key in the Authorization header, e.g.

`Authorization: Bearer your_api_key`

<aside class="notice">
You must replace <code>your_api_key</code> with your API key.<br />
</aside>

For more information on Bearer Tokens and OAuth 2.0 please see [The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://datatracker.ietf.org/doc/rfc6750).

<!-- # Versioning

The Kasko API is continually being improved and expanded, but we try to make changes in a way that does not break the contract between us, as a service provider, and you as the API consumer. As such we consider the following changes to be "non-breaking".

* Adding new API endpoints
* Adding new optional request parameters to existing endpoints
* Adding new properties to existing responses
* Changing the order in which properties appear in existing responses
* Changing the length or format of string IDs

We are currently running on one version of the API as we have not made any breaking changes so far. When we need to create a new version we will publish a new URL to our consumers, containing a version number, e.g.

`https://api.kasko.io/v2/api_endpoint_here` -->

# Pagination

> Paginated responses return JSON structed like this:

```json
{
"_embedded":{
    "item": [
      {
        "id": 1
      },
      {
        "id": 2
      },
      {
        "id": 3
      },
      {
        "id": 4
      }
    ],
    "_links": {
      "next": {
        "href": "https://api.kasko.io/policies/?since=1444411555&"
      },
      "prev": {
        "href": "https://api.kasko.io/policies/?until=1444411555&"
      }
    }
  }
}
```
Endpoints that return lists of objects support pagination to ensure performance and efficiency when retrieving data. Pagination controls are expressed as query string parameters in the endpoint URL, e.g.

`https://api.kasko.io/api_endpoint_here?since=1444411555&limit=20`

Responses on these endpoints split the data and pagnation information into two sections called `item` and `_links` repectively. The `item` section simply contains a single array containing the returned objects. The `_links` section contains the following information:

* Link to the next page in pagination.   Call the href in next to get more data
* If this has a since=?timestamp then that means there is another page of data
* If there is no next then there is no more data to retrieve
* Link to previous page of data.   If this is just the base URL then there is no previous data

Use the following query string parameters to control the pagination.

Parameter | Type | Default | Description
--------- | ---- | ------- | -----------
<span class="nowrap">`since`</span> | <span class="nowrap">`integer`</span> | <span class="nowrap">`0`</span> | Time you want to retrieve data created or updated since.  Should be in format unix timestamp or 2015-10-14T12:52:46+00:00 (URL ENCODED)
<span class="nowrap">`until`</span> | <span class="nowrap">`integer`</span> | <span class="nowrap">`0`</span> | Time you want to retrieve data created or updated until.  Should be in format unix timestamp or 2015-10-14T12:52:46+00:00 (URL ENCODED)
<span class="nowrap">`limit`</span> | <span class="nowrap">`integer`</span> | <span class="nowrap">`20`</span> | Maximum number of results to return in the dataset.

<aside class="notice">
Some endpoints support additional parameters for controlling pagination, and some endpoints may override the above defaults
</aside>

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
<span class="nowrap">`id`</span> | <span class="nowrap">`string`</span> | Kasko internal policy ID.
<span class="nowrap">`insurer_policy_id`</span> | <span class="nowrap">`string`</span> | A policy reference for use by policyholders and insurers.
<span class="nowrap">`insurer_product_name`</span> | <span class="nowrap">`string`</span> | The insurer reference name of insurance product used by this policy.
<span class="nowrap">`insurer_variant_id`</span> | <span class="nowrap">`integer`</span> | The insurer reference id of the product variant used by this policy.
<span class="nowrap">`first_name`</span> | <span class="nowrap">`string`</span> | The given name of the policyholder.
<span class="nowrap">`last_name`</span> | <span class="nowrap">`string`</span> | The family name of the policyholder.
<span class="nowrap">`email`</span> | <span class="nowrap">`string`</span> | The email address of the policyholder.
<span class="nowrap">`currency`</span> | <span class="nowrap">`string`</span> | Currency code of the policy quote and subsequent transaction in ISO-4217 format.
<span class="nowrap">`amount`</span> | <span class="nowrap">`integer`</span> | Total price paid by policyholder, expressed in the minor unit of the currency used, or the major unit if the currency has only one.
<span class="nowrap">`gross_premium`</span> | <span class="nowrap">`integer`</span> | Gross premium of the policy expressed in the minor unit of the currency used, or the major unit if the currency has only one.
<span class="nowrap">`status`</span> | <span class="nowrap">`integer`</span> | Status will either be PAID or Cancelled.   If a Policy is cancelled it will be returned with the new status and an update updated_at timestamp.
<span class="nowrap">`start_date`</span> | <span class="nowrap">`string`</span> | Cover start datetime in ISO-8601 format.
<span class="nowrap">`end_date`</span> | <span class="nowrap">`string`</span> | Cover end datetime in ISO-8601 format.
<span class="nowrap">`created_at`</span> | <span class="nowrap">`string`</span> | Policy creation datetime in ISO-8601 format.
<span class="nowrap">`updated_at`</span> | <span class="nowrap">`string`</span> | Time at which policy was updated.


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
    // handle error
  }

  curl_close($curl);
  $policies = json_decode($result);
?>
```

> The API reponse returns JSON structured like this:

```json
{
  "_embedded": {
    "item": [
      {
        "id": "0qGR3prv694AKBOw8Qk8PVNazDlxY7Wj",
        "livemode": false,
        "insurer_policy_id": "ABC-0004F",
        "insurer_variant_id": "1",
        "insurer_product_name": "Kasko SB-Deckung",
        "first_name": "Nikolaus",
        "last_name": "Suehr",
        "email": "nsuehr@kasko.io",
        "amount": 5794,
        "gross_premium": 5294,
        "currency": "eur",
        "status": "paid",
        "start_date": "2015-10-11T23:00:00+0000",
        "end_date": "2015-10-23T22:59:59+0000",
        "created_at": "2015-10-09T17:20:43+0000",
        "updated_at": "2015-10-09T17:25:55+0000",
        "assets": [
          {
            "name": "policy",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-0004F/Policy.pdf?Expires=1444850020&Signature=OoOIoyRXPMT2zSSoYtCLOsGTVrBetAJzUDGARwNTtPVMuP6joEQqo2a~kmh0wqV8KmMyBUL34tUwZcSFl6ceU8IasRANNuCLsD~M9H5dTu3r3mlaxVL68zRnf43XHr8HoKjDA2Tz0ay4AGYIe~Ssjlo5Hh4vWMFpdJ8GcGSQAWl4T0uyMtreoK04IeX0nNx1qEGVtx~McQl3j7fApl5phTyMzvaT9HHIX-WJGJvDlDI~ycCVtpd2MJopGf5SU1nZUfaRDW4jx5zubo9qE~dtVxAZ1ccxD4kU6BgO7oyXMkrdP298CFNYqYeXihu11wvVbSYwE4ibY4nkAN3Wbs2Rrw__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Versicherungsbedingungen",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-0004F/Versicherungsbedingungen.pdf?Expires=1444850020&Signature=Y5Rj0viQBGm-WggKoRs~9KBuSHgp6r6hupLCOcirIiflvtr2taKdSn7mowVfldiZ3GrV6VARwPyRyO~14K3FUFqUgWND1XMRBjDI76rlQe-dlhbLPHEbCOEPCRsaBI8o6T8Yi6KZyFszixSyut17S0gfKD8U8ZipO5qZLmcdtjQrJFALuhSp3WsUyCtN-2heq0G-YcoidQkHfDl9IUn9-bJTPwIip7q4YCCrig7yzEEHihd1qqVyHCYarBCntWcfU8Lxvl2Ty3cwDEO1e2L15zuXzmHWcw2dow3vjYTRBu7R7Vplpu9Ssm1cMW46fypHBnPDBoDtKDJeJQPcdlwPxA__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Produktinformation",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-0004F/Produktinformation.pdf?Expires=1444850020&Signature=RWIOSAIgQAHMLN6PFntn-jE3fQSGZMKQAvJB3~E26mpjV0xupxuTkCF5mWdW6wVNtJEbwSEnWe61VDjPHcjQPGt1jHWP6W7g5m~CSU8nHsLuJ5rgQgqXUsN-pS7lyJ2FlXpA~2xLNaxvvMHmH4eeScn-B9qRRCMriQR-nIeIKYWVO1MvmSaVETWKKYnwjocbc-lZOIreHmNy9F3-mqnh~igOwX0bf4rp-vbkrrbY24MojLfRyXJ6NZYlCqaaZuMSWtGTPyO30S9~g1wRz77Z6iF9wjD~aS7MQf~D833GpBooSK41lm1soQyY649-FWIVIM9GuqvO9v5QodnN77c~Vw__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Informationspflicht",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-0004F/Informationspflicht.pdf?Expires=1444850020&Signature=Z0pVN1Ul0luta0o-RI-zgrLW3--t9ss9KADoHF9VJ3xylP5nNv9jRT9jubjceRYJ3pwq5EIsZi5MHGj45WzV6gu~Yj2NUU51iBmqyNCLQv378cYGKcab~mGHenYKIVXUtZtE5tZz2igSeAbxL3iLmKo1h4E7IDLx7qi6n-QF0x01eYpFluBOKONsF3T1Pk8uIyhyzk1atiuQ~riNY4Rnh10MeUKLkaMW589jWlldRaVCRsMkE8V6-NJvhp288IYJiQZ0pzhW4j-AXz4LQZNP-HtZ0DOCO~HGSPfvTJcUzrKALM39VPSHXrwslj-zKhr-UT1zL2KLuo3OSpdyfGdb8g__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          }
        ],
        "_links": {
          "_self": {
            "href": "https://api.kasko.io/policies/0qGR3prv694AKBOw8Qk8PVNazDlxY7Wj"
          }
        }
      },
      {
        "id": "ae5lQ6pL8zP712Oo4MkKRVrN9xX0AWZb",
        "livemode": false,
        "insurer_policy_id": "ABC-00057",
        "insurer_variant_id": "1",
        "insurer_product_name": "Kasko SB-Deckung",
        "first_name": "Matthew",
        "last_name": "Wardle",
        "email": "mwardle@kasko.io",
        "amount": 9084,
        "gross_premium": 8319,
        "currency": "eur",
        "status": "paid",
        "start_date": "2015-10-21T23:00:00+0000",
        "end_date": "2015-10-22T22:59:59+0000",
        "created_at": "2015-10-14T17:50:24+0000",
        "updated_at": "2015-10-14T17:50:50+0000",
        "assets": [
          {
            "name": "policy",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-00057/Policy.pdf?Expires=1444850020&Signature=PccIgUOy0xF-G0oRGKfCCxdqTr9aRcAD82vMo0MmCAeRl1urj1qBM3UtW7VYenyaOWSDQ6Wt5WihXFw3OsIsDSAbKkpxZD7P7oVqL7SN8leGUbSCEli4lNRlvTawW8to4Ow0qY-3lpenav4bWAtkbahXlPJH~fIYDeWMsirwooGS07ssJknGrsUkA~4RiKIywdcTuAGwRaElR5bU0vL4sflNvz23snpRJbCT7pxM-Ogow~diiIADPiGFUNkG9nWaH4ef2KVkyMP53ISuTcPuzBZZQRoaw635Fxu-ZeVLR763-Bwm00Ix2KUC18qRNZrVNut-DQeHUTUxuHboKXb82g__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Versicherungsbedingungen",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-00057/Versicherungsbedingungen.pdf?Expires=1444850020&Signature=lUUd5oC3eVYxJNtiLhDXG-WNkn4t6qTiaXivKGisozmJebjbCsVKUOeyqV4iRCXyU8fp~jTCPLarlGTNVBjU5GQdeqCdvzqo4-SF223wJCCC10gWGX390ea~-lxEGX-ANs13Q9MRYB1G53CRYASQQsDw3rs3T1rr8ZGAG5i18n1Xcthia49MIswqeT-SpK47W6rrk29AUL1PdGGd9qcaox5mtThfgzWqRtnZyW5fULeh5qAI28ptfY~wett-zgpgnl7PGKPL-rqvI0G1NsQpxE1ci0XiDoHruG2j0L73sXITKsKJTc0F~~EkGKDY97~iCm9oHY-kqWgby~B7qkqzOA__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Produktinformation",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-00057/Produktinformation.pdf?Expires=1444850020&Signature=JoX604LXouX9qPsAGD0jWOYGSPAmUyN~eHXq5GP0MTWowq9LApFiwMySjHHy2DJmIY7MmSR41HYjxCml39kW4RbiUoQJP~dEqfIXOQmsSOq-zDcmyx0dxeD7LBiLRZ54eST~qg3oUIBwmPC0BGc1f5JpRhBgkNkyC5H9Dtw1~5Ci7njjIoJeyRtyD4xtuteywXWlk4QsP4mi30bn1RMBG-nRGP92w6~kAxm~3bwlCcrH8Ny5yxzYOQ2-tHdycOQ0IOndfTJe5YlBhYugCpyZFLvOiGT7mKqx4ouFJ3DaT4AOfoozsvTOwpRjGT~QqFNKBREhleGTlrSljiMr20p9cQ__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          },
          {
            "name": "Informationspflicht",
            "url": "https://dhoti9gzfs9fr.cloudfront.net/policies/4BRxwO3XQ2M7b9pKvydaJvKZWmEl8NG0/ABC-00057/Informationspflicht.pdf?Expires=1444850020&Signature=RtKZRTpwajYOaGBZAPPO8MdP6uGznwhSxi9jOR7wYsDCnAkPaViqPNbI5zs6INoi8dzwQf9xhb9TJrNKqpaAYaXSyQRgG570AKiH9XLid0lTzBpb0MxcA4-PtTKdcusjsVQNWcNWmqWlW~eoD97uA8jT81M-FLg0P3qvoOzhYSrf1iwRNu-bgSrq7bBnn9CgKvP7AbLZXv0GoWnxpBSblT~vSXRCtx7Zasw57848dZDcbO1I3Zf4lPtf3cOAKnuxcQTcYNMkVnMj8D63tmSscLzl0t9VmPQJ7I9aMhHmuHuHdyqSx7cjfBDZTJHepnmeA5gYnaIzRn9UAjh82pJC2w__&Key-Pair-Id=APKAJEGNM2PTOZTFTLNA"
          }
        ],
        "_links": {
          "_self": {
            "href": "https://api.kasko.io/policies/ae5lQ6pL8zP712Oo4MkKRVrN9xX0AWZb"
          }
        }
      }
    ]
  },
  "_links": {
    "next": {
      "href": "https://api.kasko.io/policies/?since=1444845050"
    },
    "prev": {
      "href": "https://api.kasko.io/policies/?until=1444411555"
    }
  }
}
```

This endpoint retrieves all policies.

### HTTP Request

`GET https://api.kasko.com/policies`

### Query Parameters

Please use the [standard pagination query parameters](#pagination) above to get all the data.

This should be polled at intervals with a ?since=time set to get the latest data.

Any policy that has been updated, e.g. cancelled will also be returned.

If a policy has been cancelled it's status will be updated to cancelled.


