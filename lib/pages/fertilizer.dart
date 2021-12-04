import 'dart:convert';

import 'package:agriease/pages/mandidata.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Fertilizer extends StatefulWidget {
  @override
  _FertilizerState createState() => _FertilizerState();
}

class _FertilizerState extends State<Fertilizer> {
  Map data={};
  var finalinfo;

  void setup(var soilname){
    Navigator.pushNamed(context, "/fertifinal",arguments: {
      'finalinfo':finalinfo[soilname],
    });
  }

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    finalinfo=data['fertilizer'];
    print(finalinfo);
    return Scaffold(
      backgroundColor: Colors.white,

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

              flexibleSpace:FlexibleSpaceBar(title: Text('Agriease Soiltype',style: GoogleFonts.zillaSlab(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                                  setup("Sandy");
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 175.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: AssetImage('lib/asset/Sandy.jpg')),
                                          borderRadius: BorderRadius.all(Radius.circular(18.0)),

                                        ),
                                      ),
                                    ),
                                    Text("Sandy",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Sandy Soil is light, warm, dry and tend to be acidic and low in nutrients.Sandy soils are often known as light soils due to their high proportion of sand and little clay (clay weighs more than sand).These soils have quick water drainage and are easy to work with.",style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              setup("Loamy");
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 175.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: AssetImage('lib/asset/Loamy.jpg')),
                                          borderRadius: BorderRadius.all(Radius.circular(18.0)),

                                        ),
                                      ),
                                    ),
                                    Text("Loamy",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text("Loam soil is a mixture of sand, silt and clay that are combined to avoid the negative effects of each type.These soils are fertile, easy to work with and provide good drainage. Depending on their predominant composition they can be either sandy or clay loam.",style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              setup("Black");
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 175.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: AssetImage('lib/asset/Black.jpg')),
                                          borderRadius: BorderRadius.all(Radius.circular(18.0)),

                                        ),
                                      ),
                                    ),
                                    Text("Black",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text("The black soils are also called regur (from the Telugu word Reguda) and black cotton soils because cotton is the most important crop grown on these soils. Several theories have been put forward regarding the origin of this group of soils but most pedologists believe that these soils have been formed due to the solidifaction of lava spread over large areas during volcanic activity in the Deccan Plateau, thousands of years ago.",style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              setup("Red");
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Container(
                                        width: 175.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: AssetImage('lib/asset/Red.jpg')),
                                          borderRadius: BorderRadius.all(Radius.circular(18.0)),

                                        ),
                                      ),
                                    ),
                                    Text("Red",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text("Red soil is a type of soil that develops in a warm, temperate, moist climate under deciduous or mixed forest, having thin organic and organic-mineral layers overlying a yellowish-brown leached layer resting on an illuvium red layer. Red soils are generally derived from crystalline rock.",style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.green[900],
                          child: InkWell(
                            onTap: (){
                              setup("Clayey");
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Container(
                                        width: 175.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(

                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: AssetImage('lib/asset/Clay.jpg')),
                                          borderRadius: BorderRadius.all(Radius.circular(18.0)),

                                        ),
                                      ),
                                    ),
                                    Text("Clayey",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text("Clay Soil is a heavy soil type that benefits from high nutrients. Clay soils remain wet and cold in winter and dry out in summer.These soils are made of over 25 percent clay, and because of the spaces found between clay particles, clay soils hold a high amount of water.",style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                    )
                                  ],
                                ),
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

    );
  }
}
