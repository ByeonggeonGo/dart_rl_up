import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataLoader {
  final url = Uri.https(
    'www.googleapis.com',
    '/books/v1/volumes',
    {'q': '{http}'},
  );

  final url2 = Uri.https("api.upbit.com", "/v1/market/all?isDetails=false");

  get_data() async {
    print('ok');
    final response = await http.get(url2);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return response.statusCode;
    }
  }
}
