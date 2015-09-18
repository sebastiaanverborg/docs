# Errors

> The API error reponse returns JSON structured like this:

```json
{
  "error": {
    "code": "AUTH_KEY_INVALID",
    "httpCode": 400,
    "message": "Your supplied API key is invalid."
  }
}
```

The Kasko API uses standard HTTP status codes to indicate the success or failure of a request. Codes in the 200s indicate success, those in the 400s indicate a problem with your request and those in the 500s indicate a problem with Kasko's servers.

For unsuccessful requests (those not in the 200s) the API will return a JSON error object along with the HTTP status code. This object will provide you with more information on what went wrong and any remedial action needed. The error object can also be used to provide more meaningful feedback to your users when making API requests from within your web site or mobile application.

Kasko Error Code | Description
---------------- | -----------
`AUTH_KEY_NOT_FOUND` | You did not supply an API key in the request.
`AUTH_KEY_INVALID` | Your supplied API key is invalid.
`PARAM_NOT_FOUND` | A required query string parameter was not found.
`RESOURCE_NOT_FOUND` | The requested resource does not exist.
`ENDPOINT_NOT_FOUND` | The requested API endpoint does not exist.
`RATE_TOO_HIGH` | You are hitting the API with too many requests. Please slow down. 

HTTP Code | Meaning | Description
--------- | ------- | -----------
200 | OK | Everything worked fine.
400 | Bad Request | There's something wrong with your request. A required parameter is missing, or perhaps the request body is malformed.
401 | Unauthorized | You did not supply a API key in the `Authorization: Bearer {key}` header, or your token is invalid/expired.
403 | Forbidden | You are not allowed to access this endpoint; authenticating will make no difference.
404 | Not Found | You requested a resource or an endpoint that does not exist.
405 | Method Not Allowed | You used the wrong HTTP verb for the endpoint.
406 | Not Acceptable | You requested a format that is not supported by the endpoint, i.e. not JSON
429 | Too Many Requests | You are requesting too quickly and need to slow down. Please see [rate limiting](#rate-limiting) for more information.
500 | Internal Server Error | We had an unexpected problem with our server. Please try again later.
503 | Service Unavailable | We are temporarially offline for scheduled maintanance. Please try again later.