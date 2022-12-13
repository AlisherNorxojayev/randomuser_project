import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, dynamic> queryParam = {'results': '10'};
Uri url = Uri(
    scheme: 'https',
    host: 'randomuser.me',
    path: 'api/',
    queryParameters: queryParam);

Future<List> getData() async {
  http.Response response = await http.get(url);
  Map dataFromJson = jsonDecode(response.body);
  print(dataFromJson["results"]);

  return dataFromJson['results'];
}
