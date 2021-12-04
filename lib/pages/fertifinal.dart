import 'dart:convert';

import 'package:agriease/pages/mandidata.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Fertifinal extends StatefulWidget {
  @override
  _FertifinalState createState() => _FertifinalState();
}

class _FertifinalState extends State<Fertifinal> {
  Map data={};
  var finalinfo;

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    finalinfo=data['finalinfo'];
    print(finalinfo);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Fertilizer",style: GoogleFonts.zillaSlab(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green[900]),),
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
          itemCount: finalinfo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12.0,5,12,5),
              child: Container(

                color: Colors.green[900],
                child: Card(
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  shadowColor: Colors.lightGreenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        Text('${finalinfo[index]['Crop Type']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.green[600]),),
                        Text('Temparature: ${finalinfo[index]['Temparature']} °C',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                        Text('Humidity: ${finalinfo[index]['Humidity']} %',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                        Text('Moisture: ${finalinfo[index]['Moisture']} % ',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Container(
                              height: 118,
                              width: 85,
                              color: Colors.green[900],
                              child: Card(
                                  elevation: 15,
                                  shadowColor: Colors.greenAccent,
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),child: Center(child: Text("${finalinfo[index]['Fertilizer Name']}",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.green[900]),))),
                            ),
                            Container(
                              color: Colors.green[900],
                              child: Card(
                                elevation: 15,
                                shadowColor: Colors.greenAccent,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    children: [
                                      Text('Nitrogen:${finalinfo[index]['Nitrogen']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[900]),),
                                      Text('Potassium:${finalinfo[index]['Potassium']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[900]),),
                                      Text('Phosphorous:${finalinfo[index]['Phosphorous']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[900]),),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
