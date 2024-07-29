
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
    Future<Map> apiCalling()
    async {
        Uri uri=Uri.parse('https://dummyjson.com/products');
        Response response= await http.get(uri);
        if(response.statusCode==200)
            {
                final body=response.body;
                final json= jsonDecode(body);
                return json;
            }
        return {};
    }

}