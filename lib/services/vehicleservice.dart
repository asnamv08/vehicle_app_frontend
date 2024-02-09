import 'dart:convert';

import 'package:http/http.dart 'as http;
import 'package:vehicle/models/vehiclemodel.dart';

class VehicleApiService{
  Future<dynamic>senddata(
      String name,String number,String type,String price,
      ) async{
    var client=http.Client();
    var apiurl=Uri.parse("http://192.168.251.163:3001/api/vehicleapp/add");
    var response=await client.post(apiurl,
        headers: <String,String>{
          "Content-Type":"application/json; charset=UTF-8"
        },
        body:jsonEncode(<String,String>{
          "vehiclename":name,
          "vehiclenumber":number,
          "vehicleType":type,
          "vehicleprice":price
        }));
    if(response.statusCode==200)
    {
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception("Failed To Send Data");
    }

  }
}
