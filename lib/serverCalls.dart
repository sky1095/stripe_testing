import 'package:http/http.dart' as http;

class ServerCalls {
  Future<String> fetchEphemeralKey(String apiVersion) async {
    var response = await http.get(
        "https://tankmates.org/twobyfast/non-wp/custom-endpoints/stripe_generateVolatileKey.php?api_version=" +
            apiVersion);
    print("Response:" + response.body);
    if(response.statusCode< 200 || response.statusCode >200){
      throw Exception('Get Error: statuscode = ${response.statusCode}');
    } else{
      return Future.value(response.body);
    }
  }

  // Future setPaymentIntent() async{
  //   var res = await http.post(url)
  // }
}
