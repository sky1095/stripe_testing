library stripe_testing.globals;

import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:stripe_testing/serverCalls.dart';
import 'package:stripe_testing/stripeApiCalls.dart';

String apiResponse = "no response";
String customerId = "";
String methodId = "";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StripeApiCalls api = StripeApiCalls();
  ServerCalls server = ServerCalls();
  final card = StripeCard(
    
  );
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    api.exampleSetupStripeApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(apiResponse),
          ),
          Center(
            child: RaisedButton(
              child: Text("Send"),
              onPressed: () async {
                api.getEphemeralKey().then((onValue) {
                  setState(() {
                    apiResponse = onValue;
                  });
                });
              },
            ),
          ),
          CardForm(
            card: card,
            formKey: formKey,
          ),
          FlatButton(
            child: Text("Pay"),
            onPressed: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                var cardtoJson = card.toMap();
                print(cardtoJson.toString());
                api.setPayment(card);
              }
            },
          )
        ],
      ),
    );
  }
}
