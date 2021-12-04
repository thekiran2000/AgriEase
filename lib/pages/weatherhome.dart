import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Weatherhome extends StatefulWidget {
  @override
  _WeatherhomeState createState() => _WeatherhomeState();
}

class _WeatherhomeState extends State<Weatherhome> {

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

  void setup(String query)async{
     weatherdata inst=weatherdata(name: query);
     await inst.getdata();
     print("hello");
     print(query);

     if(inst.list["cod"]=="404"){
       Navigator.pushReplacementNamed(context, "/weatherhome");
     }
     else{
       Navigator.pushNamed(context, "/weatherhome2",arguments: {
         'list':inst.list,
       });
     }


   }

   var cityname="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
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

            flexibleSpace:FlexibleSpaceBar(title: Text('Agriease Weather',style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
//                RaisedButton(onPressed: setu)
                Image.asset("lib/asset/globe.gif",width: 190,height: 280,),
                  Container(
                    child: Form(
                        child: Column(
                        children: [
                          Text("Search Weather",style:GoogleFonts.zillaSlab(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                          Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(

                                onFieldSubmitted: (value){
                                  setState(() {
                                    cityname=value;
                                  });
                                },
                                style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                decoration: InputDecoration(

                                  hintText: "Enter City Name",
                                  hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),


                                ),


                              ),
                            ),
                          ),
                        ),
                        Container(height:46,width: 220,child: RaisedButton(color: Colors.blue,child:Text("Submit",style: GoogleFonts.aladin(fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 20),),onPressed:(){setup(cityname);}))
                      ],
                    )),
                  )


              ]
              ),

          ),
        ]

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
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
