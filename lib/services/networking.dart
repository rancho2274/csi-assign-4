import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
    Response response= await get(Uri.parse(url));
    if(response.statusCode==200){
      String data= response.body;
      var decodeData= jsonDecode(data);
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
  }
}