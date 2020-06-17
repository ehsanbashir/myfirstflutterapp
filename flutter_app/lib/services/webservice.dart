
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T> {
  final String url;
  final String key;
  T Function(Response response) parse;

  Resource({this.url, this.key, this.parse});
}

class Webservice {

  Future<T> load<T>(Resource<T> resource, String key) async {

      final response = await http.get(resource.url);
      if(response.statusCode == 200) {
        return resource.parse(response);
      } else {
        throw Exception('Failed to load data!');
      }
  }

}