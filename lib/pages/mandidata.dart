import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class mandidata{

  mandidata();
  var name;
  var list;

  void getdata()async
  {
    Response response=await get("https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000157c61d8e37a3474456e35e09556732a5&format=json&offset=0&limit=10000");
    Map data=jsonDecode(response.body);
    list=data["records"];



  }




}
