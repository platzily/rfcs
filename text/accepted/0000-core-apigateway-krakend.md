- Start Date: (2021-01-12)
- RFC PR: (leave this empty)
- Platzily Issue: (leave this empty)

# Summary

Core Services is in charge of Authentication and Authorization Method to protect the application from attacks and organizer the users calls.

Services like:

- API Gateway
- Authentication for end users.
- Authorization for private microservices.

For this reason, the core team look to promote the use of KrakenD as Apigateway for Platzily.

# Motivation

## Why are we doing this?

This development will allow improvement in different knowledge, for example, the correct form to create an architecture, what must have in consideration for implement how's

- The system requires control for all the calls inside the application and manages the APIs issues, campaigns, stanlinks, and users.
- Providers of services.
- Handling information secure with encryption or hashing with JWK.
- Generate the integration services with standardize method.

## What use cases does it support?

- Expose a public API with only the methods the client need.
- Maintain as private the services and methods who need to be private.
- Protect the application from attacks.
- Protect the user information.

## What is the expected outcome?

- Successfully control over authentication services.
- Manage the API calls.
- A healthy application traffic.
- Monitoring the status of the app.

# Detailed design

## L1

![https://uc1feaf8fe81201d07f0f43bade8.previews.dropboxusercontent.com/p/thumb/ABaRzS_CeGVHdGSeHRGxA6NXKyB5ZtTdactD9hhylK9KpRj_-4FSPhcdVILWzf6IaQy9kkzzExZZq8OUP7biKYPQfOa7PyYAYLLgNFTV_xDLBJNNAGtuA0PziKJndJ3QKWBe_4a91AodViEwZWUpxwbNAAHyrojPVNJRJGX_Pt6Vm-hgv0M-knW5HF0AxOlD6UQdKrCluYZGQ-jSosYTuoPHfNiinVx9AYYFszApM2SfkoMK0sUEm3oiAFBNRpZC76-9XiQ4JUUfm7qnfFVlFdS3WyNSVyeJVNQieYnETU3VhjCfmutLBAYsbh7P56eH6nDXnVExelJVtm6p8ZUYowmccYLeAIyanraeVEbkarKq1ZUGj8wcL10WFWec-9MObjg/p.jpeg](https://uc1feaf8fe81201d07f0f43bade8.previews.dropboxusercontent.com/p/thumb/ABaRzS_CeGVHdGSeHRGxA6NXKyB5ZtTdactD9hhylK9KpRj_-4FSPhcdVILWzf6IaQy9kkzzExZZq8OUP7biKYPQfOa7PyYAYLLgNFTV_xDLBJNNAGtuA0PziKJndJ3QKWBe_4a91AodViEwZWUpxwbNAAHyrojPVNJRJGX_Pt6Vm-hgv0M-knW5HF0AxOlD6UQdKrCluYZGQ-jSosYTuoPHfNiinVx9AYYFszApM2SfkoMK0sUEm3oiAFBNRpZC76-9XiQ4JUUfm7qnfFVlFdS3WyNSVyeJVNQieYnETU3VhjCfmutLBAYsbh7P56eH6nDXnVExelJVtm6p8ZUYowmccYLeAIyanraeVEbkarKq1ZUGj8wcL10WFWec-9MObjg/p.jpeg)

## L2

![https://uce963dacaa80dcc74be43d832d8.previews.dropboxusercontent.com/p/thumb/ABbCu7ds7OGz-HzXs_4BXmMsJ9hbj8N1BRvxO6McM3oVgCsfHYg79mZ64_Ca9-qUhPa8VPr4N9WTDppAfBK-2K3mvzHqp2tYDJNdhQJ9ERGC7nYrzUObwRWnUjRqv32PO0DMrcUp7PTfDHnLf8s-TE1jF1OsGmao3hisq2w9P7s41JvcbaqEibZMLUz_I8oYMD3_mJPtB4bHql0qI5koU6xr7di2CTDNedfZVJws-BkZ3WmC9gBnBsI3MEvyCZs5-PzeKm7p0pBXart4c0PFD0bJ24jjLYwYTxqYv5lUhovEANQK3uvJZlQsaz5LvFxSYDBkFdqEhDswZ8rmxYrJ0Z61-6uGE6oSFgdogPAAYKFVFH0Wgjydse_FYWykYcZF-eI/p.jpeg](https://uce963dacaa80dcc74be43d832d8.previews.dropboxusercontent.com/p/thumb/ABbCu7ds7OGz-HzXs_4BXmMsJ9hbj8N1BRvxO6McM3oVgCsfHYg79mZ64_Ca9-qUhPa8VPr4N9WTDppAfBK-2K3mvzHqp2tYDJNdhQJ9ERGC7nYrzUObwRWnUjRqv32PO0DMrcUp7PTfDHnLf8s-TE1jF1OsGmao3hisq2w9P7s41JvcbaqEibZMLUz_I8oYMD3_mJPtB4bHql0qI5koU6xr7di2CTDNedfZVJws-BkZ3WmC9gBnBsI3MEvyCZs5-PzeKm7p0pBXart4c0PFD0bJ24jjLYwYTxqYv5lUhovEANQK3uvJZlQsaz5LvFxSYDBkFdqEhDswZ8rmxYrJ0Z61-6uGE6oSFgdogPAAYKFVFH0Wgjydse_FYWykYcZF-eI/p.jpeg)

## L3

![https://ucac5199e91f64ec64ddb5da4c65.previews.dropboxusercontent.com/p/thumb/ABbS_kKPFwEcbnFaTkeTuvqnyq-IaoZANpx9d7pmALJSjRy7voHsj7Fhl3L-LU_YZBUx0BmM1ezLlO2I__1XXat5HYNvjQU2zAQLQtBJDUTJTxMPHk9Yj5JcoSfuE9EXJS6JZ-xtNWwir9zb3DNjHJLgn7vvEobYIM3Qu5ysnJAFsoOt4j5T2Pl_osz4U_CCFCBnQL1yvrHtIuO-KKVFiJRaFDtpTvnxnL2jXPHYx8q7HcpuXfge8tBCeDCcFhhifZJcFBNUlI-o4ppyrv-ta8H3baKpFGGWDD_YK1-kHil7XBmS536_bxOaqOshMyXr2shKESIEZolon_69az1EOZ9BiNmYSfhP9Y8ZvDBVcUNQ4h68EExFXsgv0y1vHqmUbt4/p.jpeg](https://ucac5199e91f64ec64ddb5da4c65.previews.dropboxusercontent.com/p/thumb/ABbS_kKPFwEcbnFaTkeTuvqnyq-IaoZANpx9d7pmALJSjRy7voHsj7Fhl3L-LU_YZBUx0BmM1ezLlO2I__1XXat5HYNvjQU2zAQLQtBJDUTJTxMPHk9Yj5JcoSfuE9EXJS6JZ-xtNWwir9zb3DNjHJLgn7vvEobYIM3Qu5ysnJAFsoOt4j5T2Pl_osz4U_CCFCBnQL1yvrHtIuO-KKVFiJRaFDtpTvnxnL2jXPHYx8q7HcpuXfge8tBCeDCcFhhifZJcFBNUlI-o4ppyrv-ta8H3baKpFGGWDD_YK1-kHil7XBmS536_bxOaqOshMyXr2shKESIEZolon_69az1EOZ9BiNmYSfhP9Y8ZvDBVcUNQ4h68EExFXsgv0y1vHqmUbt4/p.jpeg)

## API Gateway

When consumers of API content (especially in microservices) query backend services, the implementations suffer a lot of complexity and burden with the sizes and complexity of their microservices responses.

Sits between the client and all the source servers, adding a new layer that removes all the complexity to the clients, providing them only the information that the UI needs.

- Chaining Request
- Merge Request

## KrakenD API Gateway

KrakenD is a high-performance open source API Gateway.

Its core functionality is to create an API that acts as an aggregator of many microservices into single endpoints, doing the heavy-lifting automatically for you: aggregate, transform, filter, decode, throttle, auth and more.

KrakenD requires no programming, as it offers a declarative way to create the endpoints. It is well-structured and layered, and open to extending its functionality using plug-and-play middleware developed by the community or in-house.

- KrakenD Features
- Validation of JWT with KrakenD-jose plugin.
- Auth0 Integration.
- OAuth2 Client Credentials using krakend-oauth2-clientcredentials plugin.
- Revoking valid tokens.

![https://www.krakend.io/images/KrakendFlow.png](https://www.krakend.io/images/KrakendFlow.png)

## Secrets Provider (JWT Validation)

In order to increment the trustaliability of the system, krakenD allow us to use a Secrets Provider for storage of crucial information like JWK Tokens, and implement rotation of the secrets.

Can use almost any provider of the market:

- Amazon KMS
- Azure's Key Vault
- Google Cloud KMS
- Hashicorp's Vault

## OAuth2 Client Credentials

Through the OAuth 2.0 Client Credentials Grant KrakenD can request to your authorization server an access token to reach protected resources.

The client credentials authorize KrakenD, as the client, to access the protected resources.

Successfully setting the client credentials for a backend means that KrakenD can get the protected content, but the endpoint offered to the end-user is going to be public unless you protect it with JWT.

## Architecture

Objectives:

- Attenuate the coupling to the dependencies between microservices using the 'aggregation' feature of KrakenD.
- Protect resources using OAuth2 client-credential.
- it's will standardize the process to ask for config routes in other services, to upload for a helm process.

## Drawbacks

This architecture has certain drawbacks like:

- Long time development
- High complexity
- High cost
- High responsibility
- Possible fail will could make broken up all services because block authorization services.
- Hard integration between relationships with all services.
- Requires a fast learning curve for implementing.
- Support concurrency

## Conclusions

This project allows improving knowledge in software development, strengthen how to read the architecture, how to apply different methods to build one app, why generate the core services since authorization and authentication of applications, how to gearing with other services, how to implement providers for auth0 and Auth2, who to work other language and why select that.
