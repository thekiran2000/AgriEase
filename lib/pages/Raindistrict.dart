import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Raindistrict extends StatefulWidget {
  @override
  _RaindistrictState createState() => _RaindistrictState();
}

class _RaindistrictState extends State<Raindistrict> {
  Map data={};
  var state;
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    state=data['DistrictRain'];

    print(state);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Rainfall District",style: GoogleFonts.zillaSlab(fontSize: 27,fontWeight: FontWeight.bold),),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)),
        ),
      ),
      body:ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12.0,5,12,5),
              child: Container(
                height: 100,
                color: Colors.green[900],
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/rainfinal",arguments: {
                      'finalinfo':state[index],
                    });
                  },
                  child: Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    shadowColor: Colors.lightGreenAccent,
                    child: Center(child: Text('${state[index]['DISTRICT']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),)),
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
