import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as prefix0;
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:stripe_testing/homepage.dart';
import 'package:stripe_testing/serverCalls.dart';

class StripeApiCalls {
  ServerCalls server = ServerCalls();

  exampleSetupStripeApi() async {
  StripeApi.init("pk_test_tsKKoE0v2GtYIhPkUAOroo2O00FtCn7JgA");
  // See Stripe API documentation for details
  final Map<String, dynamic> cardData = {

  };
  // await StripeApi.instance.createPaymentMethod(cardData);
}

  setPayment(StripeCard card){
    // var cardBody = {
    //   "number" : card.number,
    //   "exp_month": card.expMonth,
    //   "exp_year": card.expYear,
    //   "cvc" : card.cvc
    // };
    // var dataBody = {
    //   "type" : "card",
    //   "card" : cardBody
    // };
    // print(dataBody.toString());
    // StripeApi.instance.createPaymentMethod(dataBody).then((onValue){
    //   print("Data recived from create payment method: " + onValue.toString());
    //   methodId = 
    // });
    StripeApi.instance.createPaymentMethodFromCard(card).then((onValue){
      print("PaymentMethod response: "  + onValue.toString());
      methodId = onValue["id"];
      print("Payment methodId : $methodId");
    });
  }

  Future<String> getEphemeralKey() {
    CustomerSession.initCustomerSession(
        (apiVersion) => server.fetchEphemeralKey(apiVersion));
    
    
    CustomerSession.instance.listPaymentMethods().then((onValue){
      print("List Instance:" + onValue.toString());
      customerId = onValue["id"];
      print("CustomerId : $customerId");
      apiResponse = onValue.toString();
    });
    // CustomerSession.instance.retrieveCurrentCustomer();
    return Future.value(apiResponse);
  }
}
