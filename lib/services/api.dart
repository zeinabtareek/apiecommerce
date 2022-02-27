
import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:hiveproject/model/item_model.dart';



class RemoteServices{


static Future<dynamic>tryAnotherFunc()async{
  String theUrl = 'https://fakestoreapi.com/products';
  http.Response response =await http.get(Uri.parse(theUrl));
  String data = response.body;
  var json =jsonDecode(data);
  return json;
 }
}