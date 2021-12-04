import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class weatherdata{

  weatherdata({this.name});
  var name;
  var list;

  void getdata()async
  {
    Response response=await get("http://api.openweathermap.org/data/2.5/weather?q=$name&appid=a9449a29d8e2b5c1c67bc007702719e5");
    Map data=jsonDecode(response.body);
    list=data;
    name=data['name'];
    print(data);


  }




}
