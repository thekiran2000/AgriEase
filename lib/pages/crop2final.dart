import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';

class Crop2final extends StatefulWidget {
  @override
  _Crop2finalState createState() => _Crop2finalState();
}

class _Crop2finalState extends State<Crop2final> {
  var data={};
  var crop;

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    crop=data['crop2final'];



    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Crop type & yield \n \t \t \t with year",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)),
        ),
      ),
      body:ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: crop.length,
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
                  child: Center(child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2.0,6,2,4),
                        child: Text('${crop[index]['Crop']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.green[700]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,2,8,15),
                        child: Text('${crop[index]['Yield']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,2,8,15),
                        child: Text('${crop[index]['Crop_Year']}',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                      ),
                      SizedBox(height: 5,)
                    ],
                  )),
                ),
              ),
            );
          }
      ),

    );
  }
}
