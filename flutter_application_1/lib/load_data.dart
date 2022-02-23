import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataLoader {

  final url2 = Uri.https("api.upbit.com", "/v1/market/all");

  get_coin_list() async{
    print('ok');
    final response = await http.get(url2);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } 
  }
}
