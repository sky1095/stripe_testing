import 'package:http/http.dart' as http;

class ServerCalls {
  Future<String> fetchEphemeralKey(String apiVersion) async {
    var response = await http.get(
        "https://tankmates.org/twobyfast/non-wp/custom-endpoints/stripe_generateVolatileKey.php?api_version=$apiVersion");
     print("Ephemeral Key Response Code: " + response.statusCode.toString());
    print("Ephemeral Key Response:" + response.body);
   
    if(response.statusCode< 200 || response.statusCode >200){
      throw Exception('Get Error: statuscode = ${response.statusCode}');
    } else{
      return Future.value(response.body);
    }
  }

  Future<String> createPaymentIntent(String amount, String paymentMethodID, String customerID) async {
  var headers = {
    'Accept': '/',
    'Accept-Encoding': 'gzip, deflate',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Host': 'tankmates.org',
    'cache-control': 'no-cache,no-cache',
  };

  var data = 'amount=$amount&methodStripeID=$paymentMethodID&customerStripeID=$customerID';

  var res = await http.post('https://tankmates.org/twobyfast/non-wp/custom-endpoints/stripe_createPaymentIntent.php', headers: headers, body: data);
  if (res.statusCode != 200) throw Exception('post error: statusCode= ${res.statusCode}');
  print(res.body);
  return res.body;
}


  // Future setPaymentIntent() async{
  //   var res = await http.post(url)
  // }
}
