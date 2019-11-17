import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:stripe_testing/serverCalls.dart';
import 'package:stripe_testing/successScreen.dart';
import 'common/common.dart';
import 'models.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen();

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> title;
  AppConfig _appConfig;
  int titleIndex; //Same is Page Index
  int _selectedCardIndex = 0;
  PageController _paymentPageController;
  bool futureHasData;
  bool sendingPayment;

  //Stripe Variables
  StripeCard _card;
  ServerCalls _server;
  Customer _customer;
  PaymentMethods _paymentMethods;
  PaymentMethodsDatum _newPaymentMethod;
  PaymentIntent _paymentIntent;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = ["Payment Method", "Add a Card"];
    titleIndex = 0;
    _paymentPageController = PageController(initialPage: 0, keepPage: true);
    _server = ServerCalls();
    futureHasData = false;
    sendingPayment = false;
    stripeInitializations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = AppConfig(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          title[titleIndex],
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: (!sendingPayment)
                  ? () {
                      if (titleIndex == 0) {
                        //Attach selected PaymentMethod ID and Create Payment Intent
                        setState(() {
                          sendingPayment = true;
                        });
                        _createPaymentIntent("1000", _paymentMethods.data[_selectedCardIndex].id).then((onValue) {
                          if ((onValue.charges.data[0].captured) &&
                              (onValue.status == "succeeded")) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen()));
                          } else {
                            setState(() {
                              sendingPayment = false;
                            });
                            Future(() {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Something went wrong! Please try again with a different Card",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ));
                            });
                          }
                        });
                      } else if (titleIndex == 1) {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var cardtoJson = _card.toMap();
                          print(cardtoJson.toString());
                        }
                      }
                    }
                  : null),
        ],
        actionsIconTheme: IconThemeData(color: Colors.white, size: 18.0),
      ),
      backgroundColor: Color(0xfff4f3f6),
      body: (futureHasData)
          ? (sendingPayment)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PageView(
                  controller: _paymentPageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    listAvailableCards(),
                    WillPopScope(
                        onWillPop: () {
                          setState(() {
                            --titleIndex;
                          });
                          _paymentPageController.previousPage(
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 300));
                          return Future.value(false);
                        },
                        child: addNewCard()),
                  ],
                )
          : FutureBuilder(
              future: futureStage1(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  futureHasData = true;
                  return PageView(
                    controller: _paymentPageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      listAvailableCards(),
                      WillPopScope(
                          onWillPop: () {
                            setState(() {
                              --titleIndex;
                            });
                            _paymentPageController.previousPage(
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 300));
                            return Future.value(false);
                          },
                          child: addNewCard()),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("OOPS! Something Went Wrong!"),
                  );
                }
              },
            ),
    );
  }

  Widget addNewCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      // width: 200,
      // height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardForm(
            card: _card,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }

  Widget listAvailableCards() {
    return Container(
      child: ListView.builder(
        itemCount: _paymentMethods.data.length + 1,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return (index != _paymentMethods.data.length)
              ? ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  enabled: (_selectedCardIndex != index),
                  selected: (_selectedCardIndex == index),
                  leading: Image.asset(
                    leadingCardTypeAssetPath(index),
                    height: 38,
                    color: (_selectedCardIndex != index)
                        ? Colors.grey[600]
                        : AppTheme.primaryColor,
                  ),
                  title: Text(
                    getCardBrandName(index) +
                        " ending in " +
                        _paymentMethods.data[index].card.last4,
                    style: (_selectedCardIndex != index)
                        ? TextStyle(fontSize: 16.0)
                        : TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                            fontSize: 16.0,
                          ),
                  ),
                  trailing: (_selectedCardIndex == index)
                      ? Icon(
                          Icons.check,
                          color: (_selectedCardIndex != index)
                              ? Colors.grey[600]
                              : AppTheme.primaryColor,
                        )
                      : SizedBox(),
                  onTap: (_selectedCardIndex != index)
                      ? () {
                          setState(() {
                            _selectedCardIndex = index;
                          });
                        }
                      : null,
                )
              : ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  enabled: true,
                  leading: Icon(
                    Icons.add,
                    color: AppTheme.primaryColor,
                    size: 30.0,
                  ),
                  title: Text(
                    "Add new Card...",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    setState(() {
                      ++titleIndex;
                    });
                    _paymentPageController.animateToPage(1,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300));
                  },
                );
        },
      ),
    );
  }

  stripeInitializations() {
    //Initializing Stripe API Instance with Publishable Key
    StripeApi.init("pk_test_tsKKoE0v2GtYIhPkUAOroo2O00FtCn7JgA");
    //Creating an Instance of StripeCard
    _card = StripeCard();
    //Initializing Customer Session with Ephemeral Key
    CustomerSession.initCustomerSession(
        (apiVersion) => _server.fetchEphemeralKey(apiVersion));
  }

  Future<PaymentMethods> futureStage1() async {
    return _retrieveCurrentCustomer()
        .then((onValue) => _listAllPaymentMethods());
  }

  Future<Customer> _retrieveCurrentCustomer() {
    return CustomerSession.instance.retrieveCurrentCustomer().then((onValue) {
      print(onValue.toString());
      _customer = Customer.fromMap(onValue);
      return _customer;
    });
  }

  Future<PaymentMethods> _listAllPaymentMethods() {
    return CustomerSession.instance.listPaymentMethods().then((onValue) {
      print("Payment Methods: " + onValue.toString());
      _paymentMethods = PaymentMethods.fromMap(onValue);
      return _paymentMethods;
    });
  }

  Future<PaymentMethodsDatum> _createPaymentMethodFromCard(StripeCard stripeCard) {
    return StripeApi.instance
        .createPaymentMethodFromCard(stripeCard)
        .then((onValue) {
      print(onValue.toString());
      return PaymentMethodsDatum.fromMap(onValue);
    });
  }

  Future<PaymentMethodsDatum> _attachAvailablePaymentMethod(PaymentMethodsDatum unattachedPaymentMethod) {
    return CustomerSession.instance
        .attachPaymentMethod(unattachedPaymentMethod.id)
        .then((onValue) {
      print(onValue.toString());
      _newPaymentMethod = PaymentMethodsDatum.fromMap(onValue);
      return _newPaymentMethod;
    });
  }

  Future<PaymentIntent> _createPaymentIntent(String amount, String paymentMethodID) {
    return _server
        .createPaymentIntent(
            amount, paymentMethodID, _customer.id)
        .then((onValue) {
      print(onValue.toString());
      _paymentIntent = paymentIntentFromJson(onValue);
      return _paymentIntent;
    });
  }

  String getCardBrandName(int index) {
    switch (_paymentMethods.data[index].card.brand.toLowerCase()) {
      case 'visa':
        return "Visa";
      case 'mastercard':
        return "MasterCard";
      case 'american express':
        return "American Express";
      case 'diners club':
        return "Dinners Club";
      default:
        return _paymentMethods.data[index].card.brand.toString();
    }
  }

  String leadingCardTypeAssetPath(int index) {
    switch (_paymentMethods.data[index].card.brand.toLowerCase()) {
      case 'visa':
        return "assets/images/cards.imageset/visa_pay.png";
      case 'mastercard':
        return "assets/images/cards.imageset/mastercard.png";
      case 'american express':
        return "assets/images/cards.imageset/american_express.png";
      case 'diners club':
        return "assets/images/cards.imageset/diners-club-pay.png";
      default:
        return "assets/images/stripeCard.imageset/stripecard@3x.png";
    }
  }
}
