import 'dart:convert';

import 'package:agriease/pages/mandidata.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Mandi extends StatefulWidget {
  @override
  _MandiState createState() => _MandiState();
}

class _MandiState extends State<Mandi> {
  Map data={};

  var listfinal;
  var statename;

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    listfinal=data['info'];
    statename=data['name'];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("$statename",style: GoogleFonts.zillaSlab(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.green[900]),),
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
          itemCount: listfinal.length,
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
                  child: Column(
                    children: [
                      Text('${listfinal[index]["district"]}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.green[600]),),
                      Text('${listfinal[index]["market"]}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(fit: FlexFit.loose,child: Container(
                              color: Colors.green[900],
                              child: Card(shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),color:Colors.lightGreenAccent[100],elevation:15,shadowColor:Colors.lightGreenAccent,child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${listfinal[index]["commodity"]}',overflow: TextOverflow.fade,style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[900]),),
                              )),
                            )),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text('Min Price',overflow: TextOverflow.fade,style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.green[700]),),
                                Text('₹ ${listfinal[index]["min_price"]}',overflow: TextOverflow.fade,style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                                Text('Max Price',overflow: TextOverflow.fade,style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.green[700]),),
                                Text('₹ ${listfinal[index]["max_price"]}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Text('Modal Price',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.green[700]),),
                      Text('₹ ${listfinal[index]["modal_price"]}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                    ],
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
