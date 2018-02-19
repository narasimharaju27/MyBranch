@RestResource(urlMapping='/my/rest/service/createCustomer')
global class CustomRestService {

  @HttpPost
  global static ResponseData createCustomer() {
    String json = RestContext.request.requestBody.toString();
    RequestPayload payload = (RequestPayload) System.JSON.deserialize(json, RequestPayload.class);

    //StripeCustomer customer = StripeCustomer.create(payload.token, payload.description);
    //StripeCustomer.updateSubscription(customer.id, 'ANNUAL_SUBSCRIPTION');

    // Update the existing account to include the Stripe Customer ID
    Account a = new Account(
      //Id = payload.accountId,
      Name= 'Narasimha'
    );
    insert a;

    ResponseData data = new ResponseData();
    data.status = 'success';

    return data;
  }

  global class RequestPayload {
    global String token;
    global String description;
    global String accountId;
  }

  global class ResponseData {
    global String status;
    global String errorMessage;
  }
}