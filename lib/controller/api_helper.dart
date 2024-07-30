
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
    String apiLink='https://dummyjson.com/products';
    Future<Map> apiCalling()
    async {
        Uri uri=Uri.parse(apiLink);
        Response response= await http.get(uri);
        if(response.statusCode==200)
            {
                final body=response.body;
                final json= jsonDecode(body);
                return json;
            }
        else{
            print('error find apiHelper');
        return {};
        }
    }

}