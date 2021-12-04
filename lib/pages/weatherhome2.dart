import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';


class Weatherhome2 extends StatefulWidget {
  @override
  _Weatherhome2State createState() => _Weatherhome2State();
}

class _Weatherhome2State extends State<Weatherhome2> {
  Map data={};
  var listfinal;
  var main;
  var tempmax;
  var tempmin;
  var desc;
  var cityname;
  var longitude;
  var lattitude;
  var visibility;
  var humidity;
  var pressure;
  var wind;
  var timestamp;
  var date;



  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    listfinal=data['list'];

    main=listfinal['weather'][0]['main'];
    desc=listfinal['weather'][0]['description'];
    cityname=listfinal['name'];

    longitude=listfinal['coord']['lon'];
    lattitude=listfinal['coord']['lat'];

    visibility=listfinal['visibility'];
    visibility=double.parse("$visibility");
    visibility=visibility/1000;
    visibility=double.parse(visibility.toStringAsFixed(2));

    humidity=listfinal['main']['humidity'];

    pressure=listfinal['main']['pressure'];
    pressure=double.parse("$pressure");
    pressure=pressure/1000;
    pressure=double.parse(pressure.toStringAsFixed(3));

    wind=listfinal['wind']['speed'];



//    for temperature
    tempmax=listfinal['main']['temp_max'];
    tempmin=listfinal['main']['temp_min'];

    tempmin=double.parse("$tempmin");
    tempmax=double.parse("$tempmax");

    tempmin=tempmin-273;
    tempmax=tempmax-273;

    tempmax=double.parse(tempmax.toStringAsFixed(2));
    tempmin=double.parse(tempmin.toStringAsFixed(2));



    if(main=="Haze" ){
      main="Smoke";
    }
    if(main=="Fog" ){
      main="Smoke";
    }

//    for night
    timestamp=listfinal['dt'];
    timestamp=int.parse("$timestamp");
    date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    print(date);
    if(date.hour>=19 && date.hour<=24 &&main=="Clear"){
      main="Night";
    }
    else if(date.hour>=0 && date.hour<=6 &&main=="Clear"){
      main="Night";
    }
    if(date.hour>=19 && date.hour<=24 &&main=="Clouds"){
      main="Nightcloud";
    }
    else if(date.hour>=0 && date.hour<=6 &&main=="Clouds"){
      main="Nightcloud";
    }
    var col;
    var A;
    var B;
    var C;
    var D;
    Color tmpColor;
    if(main=='Clear'){
      tmpColor=Colors.amberAccent[200];
    }
    else if(main=='Clouds'){
      tmpColor=Colors.cyan[300];
    }
    else if(main=='haze'){
      tmpColor=Colors.orange;
    }
    else if(main=='Rain'){
      tmpColor=Colors.grey[400];
    }
    else if(main=='Snow'){
      tmpColor=Colors.white;
    }
    else if(main=='Smoke'){
      tmpColor=Colors.tealAccent[100];
    }
    else if(main=='Mist'){
      tmpColor=Colors.deepPurpleAccent;
    }



    return Scaffold(
      backgroundColor: tmpColor,


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

              flexibleSpace:FlexibleSpaceBar(title: Text('Agriease Weather',style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.lightGreenAccent,
                        elevation: 30,
                        shadowColor: Colors.lightGreenAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("$cityname",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 37,),)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 30,
                        shadowColor: Colors.lightGreenAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset("lib/asset/$main.jpg",width: 150,height: 150,),
                                Text("$desc",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.green[600]),)
                              ],
                            ),
                            Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("$tempmax °C",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 37,color: Colors.green[800]),),
                                ),
                                Text("max",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.green[600]),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("$tempmin °C",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[800]),),
                                ),
                                Text("min",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.green[600]),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0,10,0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Container(
                              width: 113,
                              height: 143,
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Humidity",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.green[800]),),
                                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjnlFMXn6eSW5G1lJyrbesx3aCrfyaqLZvwg&usqp=CAU",width: 70,),
                                    Text("$humidity %",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 113,
                              height: 143,
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Wind",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[800]),),
                                    Image.network("https://thumbs.dreamstime.com/b/windy-icon-vector-sign-symbol-isolated-white-background-windy-icon-vector-isolated-white-background-your-web-133777160.jpg",width: 70,),
                                    Text("$wind Km/Hr",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 114,
                              height: 143,
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Pressure",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[800]),),
                                    Image.network("https://thumbs.dreamstime.com/b/thermometer-cloud-low-temperature-icon-simple-glyph-vector-weather-set-ui-ux-website-mobile-application-white-156322789.jpg",width: 70,),
                                    Text("$pressure B",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,2,10,2),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Container(
                              width: 113,
                              height: 143,

                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Longitude",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.green[800]),),
                                    Image.asset("lib/asset/long.jpg",width: 70,),
                                    Text("$longitude",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 113,
                              height: 143,
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Visibility",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[800]),),
                                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLbn6476OkxJKdDm9Jp_CGREcEGdcfELM6uw&usqp=CAU",width: 70,),
                                    Text("$visibility KM",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 113,
                              height: 143,
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.greenAccent,
                                child: Column(
                                  children: [
                                    Text("Lattitude",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.green[800]),),
                                    Image.asset("lib/asset/latt.jpg",width: 70,),
                                    Text("$lattitude",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green[600]),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                  ]
              ),

            ),
          ]

      ),

    );
  }
}
