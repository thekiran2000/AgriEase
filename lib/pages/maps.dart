import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

import 'package:search_map_place/search_map_place.dart';


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

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
  GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(20, 20));

  final List<Marker> markers = [];

  addMarker(cordinate){

    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  MapType kar=MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Find your fields",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)),
        ),

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton(

            child: Icon(Icons.satellite),
            onPressed: (){
              setState(() {
                if(kar==MapType.normal){
                  kar=MapType.satellite;
                }
                else if(kar==MapType.satellite){
                  kar=MapType.hybrid;
                }
                else if(kar==MapType.hybrid){
                  kar=MapType.normal;
                }

              });
            }
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(zoom:15,
            target: LatLng(19.9975, 73.7898)
        ),
        mapType: kar,
        onMapCreated: (controller){
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),


        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 4,
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
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
