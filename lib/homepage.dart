library stripe_testing.globals;

import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:stripe_testing/paymentScreen.dart';
import 'models.dart';
import 'serverCalls.dart';
// import 'package:stripe_testing/stripeApiCalls.dart';

String apiResponse = "no response";
Customer customer;
PaymentMethodsDatum newPaymentMethod;
PaymentIntent paymentIntent;
PaymentMethods paymentMethods;
String customerId = "";
String methodId = "";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // StripeApiCalls api = StripeApiCalls();
  ServerCalls server = ServerCalls();
  var card;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // api.exampleSetupStripeApi();
    Stripe.init("pk_test_tsKKoE0v2GtYIhPkUAOroo2O00FtCn7JgA");
    StripeApi.init("pk_test_tsKKoE0v2GtYIhPkUAOroo2O00FtCn7JgA");

    //StripeApi.instance.createPaymentMethodFromCard(card);
    //CustomerSession.instance.attachPaymentMethod()

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SelectableText(apiResponse),
          ),
           Center(
            child: RaisedButton(
              child: Text("Go To Payment Page"),
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentScreen()));
              },
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text("Initialize Customer Session"),
              onPressed: () async {
                CustomerSession.initCustomerSession(
                    (apiVersion) => server.fetchEphemeralKey(apiVersion));
                // CustomerSession.instance.listPaymentMethods().then((onValue){
                //   print(onValue.toString());
                // });
                //   api.getEphemeralKey().then((onValue) {
                //     setState(() {
                //       apiResponse = onValue;
                //     });
                //   });
              },
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                CustomerSession.instance
                    .retrieveCurrentCustomer()
                    .then((onValue) {
                  print(onValue.toString());
                  customer = Customer.fromMap(onValue);
                  print("Customer ID: " + customer.id);
                  card = StripeCard(
                    number: "378282246310005",
                    cvc: "352",
                    expMonth: 9,
                    expYear: 2023,
                    name: "Vishal Kumar",
                    country: "US",
                    customerId: customer.id,
                    currency: "USD",
                    addressCity: "New York City",
                    addressCountry: "New York",
                    addressState: "Washington DC",
                    addressLine1: "121",
                    addressLine2: "Brooklyn",
                  );
                });
              },
              child: Text("Retrieve Current Customer"),
            ),
          ),
          // data contains list of Payment Method IDs
          Center(
            child: RaisedButton(
              onPressed: () {
                CustomerSession.instance.listPaymentMethods().then((onValue) {
                  print("Payment Methods: " + onValue.toString());
                  paymentMethods = PaymentMethods.fromMap(onValue);
                  for (var x in paymentMethods.data) {
                    print("Payment Method ID: " + x.id);
                    print("Card Brand: " + x.card.brand);
                    print("Expiry: " +
                        x.card.expMonth.toString() +
                        "/" +
                        x.card.expYear.toString());
                    print("Last 4: " + x.card.last4);
                    print("\n");
                  }
                });
              },
              child: Text("List Payment Methods"),
            ),
          ),
          // CardForm(
          //   card: card,
          //   formKey: formKey,
          // ),
          // FlatButton(
          //   child: Text("Pay"),
          //   onPressed: () async {
          //     if (formKey.currentState.validate()) {
          //       formKey.currentState.save();
          //       var cardtoJson = card.toMap();
          //       print(cardtoJson.toString());
          //       //api.setPayment(card);
          //     }
          //   },
          // )
          Center(
            child: RaisedButton(
              onPressed: () {
                StripeApi.instance
                    .createPaymentMethodFromCard(card)
                    .then((onValue) {
                  print(onValue.toString());
                  newPaymentMethod = PaymentMethodsDatum.fromMap(onValue);
                });
              },
              child: Text("Create Payment Method from Card"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                CustomerSession.instance
                    .attachPaymentMethod(newPaymentMethod.id)
                    .then((onValue) {
                  print(onValue.toString());
                  newPaymentMethod = PaymentMethodsDatum.fromMap(onValue);
                });
              },
              child: Text("Attach Payment Method from Card"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                paymentIntent = paymentIntentFromJson(
                    await server.createPaymentIntent(
                        "1000", paymentMethods.data[0].id, customer.id));
                print(paymentIntent.id);
              },
              child: Text("Create Payment Intent from available list"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                paymentIntent = paymentIntentFromJson(
                    await server.createPaymentIntent(
                        "1000", newPaymentMethod.id, customer.id));
                        //newPaymentMethod or available paymentMethods.onject[index].id or something
                print(paymentIntent.id);
              },
              child: Text("Create Payment Intent"),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                //Stripe.instance.authenticatePayment(paymentIntentClientSecret)
                print("Payment Status: " + paymentIntent.status);
                print("Next Action: " + paymentIntent.nextAction.toString());
                //print("Object: " + paymentIntent.charges.data);
                for (var x in paymentIntent.charges.data) {
                  print("Captured: " + x.captured.toString());
                  print("Disputed: " + x.disputed.toString());
                  print("Failure Code: " + x.failureCode.toString());
                  print("Charge ID: " + x.id);
                  print("Outcome Network Status: " + x.outcome.networkStatus);
                  print("Outcome Type: " + x.outcome.type);
                  print("Paid: " + x.paid.toString());
                  print("Status: " + x.status);
                }
              },
              child: Text("Show payment Intent Object"),
            ),
          ),
        ],
      ),
    );
  }
}
