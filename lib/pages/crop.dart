import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';


class Crop extends StatefulWidget {
  @override
  _CropState createState() => _CropState();
}

class _CropState extends State<Crop> {
  var cropi;

  Future<String>_loadFromAsset3() async {
    return await rootBundle.loadString("lib/asset/crop.json");
  }

  Future parseJson3(var i) async {
    String jsonString = await _loadFromAsset3();
    final crop = jsonDecode(jsonString);

    Navigator.pushNamed(context, "/$i",arguments: {
      'crop':crop,
    });

  }

  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("lib/asset/Rainfall.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final Rainfall = jsonDecode(jsonString);
    Navigator.pushNamed(context, "/rainstate",arguments: {
      'Rainfall':Rainfall,
    });
  }
  Future<String>_loadfromAsset() async {
    return await rootBundle.loadString("lib/asset/Fertilizer.json");
  }

  Future parsejson() async {
    String jsonString = await _loadfromAsset();
    final fertilizer = jsonDecode(jsonString);
    Navigator.pushNamed(context, "/fertilizer",arguments: {
      'fertilizer':fertilizer,
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Drawer(
            elevation: 20,


            child: Column(
              children: [

                Image.asset("lib/asset/logo.jpg",width: 190,height: 300,),


                Container(
                  width: 250,
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      parseJson();
                    },
                    child: Card(
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 30,
                      child: Center(child: Text("Rainfall", style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 250,
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/laws");
                    },
                    child: Card(
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 30,
                      child: Center(child: Text("Gov regulations",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 250,
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/mandistate");
                    },
                    child: Card(
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 30,
                      child: Center(child: Text("Market updates",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 250,
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      parsejson();
                    },
                    child: Card(
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 30,
                      child: Center(child: Text("Fertilizer",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 250,
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/calculator");
                    },
                    child: Card(
                      shadowColor: Colors.lightGreenAccent,
                      elevation: 30,
                      child: Center(child: Text("Calculator",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold),)),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[

            SliverAppBar(


              expandedHeight: 120.0,
              backgroundColor: Colors.lightGreenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50)),
              ),

              flexibleSpace:FlexibleSpaceBar(title: Text('Agriease Crop',style: GoogleFonts.zillaSlab(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 250,
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                             parseJson3("crop1");
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset("lib/asset/crop1.jpeg",width: 80,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Crop type \n \t and its \n \t   Yield",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      ),
                                      Text("Checkout corresponding \nresults using state,district \nand year.",style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      SizedBox(height: 10,),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 250,
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              parseJson3("crop2");
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Crop type \n \t and its \n \t  Yield\n(Season)",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Checkout corresponding \nresults using state,district \nand season.",style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      ),
                                      
                                    ],
                                  ),
                                  Image.asset("lib/asset/crop2.jpg",width: 100,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 250,
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              parseJson3("crop3");
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset("lib/asset/crop3.jpg",width: 90,),
                                  Column(
                                    children: [
                                      SizedBox(height: 37,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Maximum Yield\n \t  each year",style: GoogleFonts.zillaSlab(fontSize: 31,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      ),
                                      Text("Checkout corresponding \nresults using state and \ndistrict data. ",style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      SizedBox(height: 10,),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                  ]
              ),

            ),
          ]

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        backgroundColor: Colors.lightGreenAccent,// this will be set when a new tab is tapped
        items: [

          BottomNavigationBarItem(
            icon: InkWell(onTap:(){
              Navigator.pushReplacementNamed(context, "/home");
            },child: new Icon(Icons.home)),
            title: InkWell(onTap:(){
              Navigator.pushReplacementNamed(context, "/home");
            },child: new Text('Home',style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold))),
          ),

          BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/crop");
              },child: Icon(Icons.grain)),
              title: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/crop");
              },child: Text('Crop',style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold)))
          ),
          BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/weatherhome");
              },child: Icon(Icons.cloud)),
              title: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/weatherhome");
              },child: Text('Weather',style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold)))
          ),BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushNamed(context, "/fianance");
              },child: Icon(Icons.monetization_on)),
              title: InkWell(onTap:(){
                Navigator.pushNamed(context, "/fianance");
              },child: Text('Fianance',style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold)))
          ),BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushNamed(context, "/maps");
              },child: Icon(Icons.place)),
              title: InkWell(onTap:(){
                Navigator.pushNamed(context, "/maps");
              },child: Text('Maps',style: GoogleFonts.zillaSlab(fontSize: 18,fontWeight: FontWeight.bold)))
          ),


        ],
      ),
    );
  }
}
