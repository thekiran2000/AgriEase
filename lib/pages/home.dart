import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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


  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,

            colors: [

              Colors.green[500],
              Colors.greenAccent,
              Colors.lightGreen,
              Colors.lightGreenAccent,
              Colors.green,


            ],
          ),
        ),

        child: new AlertDialog(
          title: new Text('Are you sure?',style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,color: Colors.green[900],fontSize: 35),),
          content: new Text('Do you want to exit an App',style: GoogleFonts.zillaSlab(color: Colors.green[900],fontSize: 20),),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child:  Text("NO",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,color: Colors.green[900],fontSize: 20),),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,color: Colors.green[900],fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    ) ??
        false;
  }

  final User user = FirebaseAuth.instance.currentUser;


  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.green[100],

        drawer: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Drawer(
              elevation: 20,


              child: Column(
                children: [
                  SizedBox(height: 30,),

                  Image.asset("lib/asset/jjj.png",width: 170,),
                  SizedBox(height: 10,),

                  Column(
                    children: [
                      Text("${user.email}", style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                    ],
                  ),

                  SizedBox(height: 20,),
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
                  SizedBox(height: 26,),
                  Container(
                    width: 240,
                    height: 45,
                    child: RaisedButton(
                      onPressed:(){
                        signOut();
                      },
                      color:Colors.lightGreenAccent,
                      child: Text("Logout",
                        style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),
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


              expandedHeight: 110.0,
              backgroundColor: Colors.lightGreenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50)),
              ),

              flexibleSpace:FlexibleSpaceBar(title: Text('Agriease',style: GoogleFonts.zillaSlab(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
          delegate: SliverChildListDelegate(
            [

              SizedBox(height: 10,),
              Flex(
                  direction: Axis.horizontal,
                children:[
                  Expanded(
                  child: CarouselSlider(
                    items: [

                      //1st Image of Slider
                      Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("lib/asset/img1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("lib/asset/img2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1499014603094-f0c20a708009?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1518744865364-a5323b5a9e29?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1534301935032-8f808f3e5f08?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1547114451-24066586ebbe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1504873222451-109d275ec557?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1534940519139-f860fb3c6e38?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1588696677231-1cc0e8c1ab78?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1571158047652-01ed1b854687?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1574943320219-553eb213f72d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=982&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2020/07/18/09/14/field-5416600_1280.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2010/12/13/10/04/crop-2229_1280.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/14/04/22/harvesting-1822578_1280.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),Container(


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("lib/asset/img3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),



                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 235.0,
                      enlargeCenterPage: true,

                      autoPlay: true,

                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      viewportFraction: 0.84,
                    ),
                  ),
                ),
                ]
              ),
              SizedBox(height: 10,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Contents",style: GoogleFonts.zillaSlab(fontSize: 40,color: Colors.green[900],fontWeight: FontWeight.bold),),
                ),
              ),
              Flex(
                  direction: Axis.horizontal,
                  children:[
                    Expanded(
                      child: CarouselSlider(
                        items: [

                          //1st Image of Slider


                          //2nd Image of Slider
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/crop.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Crop',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/weather.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Weather',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/rainfall.jpg',width: 93,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0,2,8,8),
                                    child: Text('Rainfall',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/mandi.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Mandi',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/fertilizer.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Fertilizer',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/Calc2.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Calculator',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/map.jpg',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Map',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  )
                                ],
                              ),
                            ),
                          ),Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors: [
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                  Colors.yellow[300],
                                  Colors.yellow[900],
                                ],
                              ),
                            ),
                            width: 360,
                            margin: EdgeInsets.all(2.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,12,0,0),
                                    child: Image.asset('lib/asset/satya.png',width: 85,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Regulations',style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                  ),

                                ],
                              ),
                            ),
                          ),




                        ],

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 170.0,
                          enlargeCenterPage: false,

                          autoPlay: true,

                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 1000),
                          viewportFraction: 0.62,
                        ),
                      ),
                    ),
                  ]
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/crop.jpg",width: 160,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Crop",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('❖ Examine the previous years records to determine your future.\n❖ Find best yields of crops in your Area\n❖ Finds best crops for your farms based on state and district wise data\n❖ Find best crops in your district based on type or season\n❖ Helps you by using best strategies !',style: GoogleFonts.zillaSlab(fontSize: 18,)),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/weather.jpg",width: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Weather",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖ Weather forecast is the way to determine how the weather behaves.\n❖ Current weather outcome using city as a input.\n❖ Helps in determining best weather condition for your crop.\n❖ Determines humidity,wind speed and pressure such rare weather components.\n❖ Also determines maximum and minimum temperature of that place.",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/rainfall.jpg",width: 180,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Rainfall",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('❖ Rain is a major component of the water cycle and is responsible for depositing most of the fresh water on the Earth.\n❖ Provides Rainfall data in your state and in your city.\n❖ Based on data you are provided by pi-chart showing Month wise rainfall in your district.\n❖ Finds Annual rainfall in your area. ',style: GoogleFonts.zillaSlab(fontSize: 18,)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/mandi.jpg",width: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Mandi (market)",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖ Agricultural marketing covers the services involved in Gilmaan moving an agricultural product from the farm to the consumer.\n❖ Shows Current Max and Min Prices of various crops \n❖ It will help you to update your knowledge on current market situations on daily basis.\n❖ It Helps you to find best time to sell or trade your crops According to markets situation. \n",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/fertilizer.jpg",width: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Fertilizer",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖ A chemical or natural substance added to soil or land to increase its fertility.\n❖ Helps in determining best fertilizer for your crop. \n❖ Provides fertilizers for crops according to soil type.\n❖ Also gives NPK values for that fertilizer. \n",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/Calc2.jpg",width: 145,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Calculator",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖Provides basic Calculations before Farming are essential to get best Yield.\n❖ In very 1st Calculation you will able to find Average no of plants in your field.\n❖ 2nd Calculation will help you to know the amount of Nitrogen , phosphorus and potassium in your Fertilizer.\n❖ by using 3rd Calculation you will be able to find yield of your crops. \n",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/map.jpg",width: 160,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Map",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖ A map is a symbolic depiction emphasizing relationships between elements of some space, such as objects, regions, or themes.\n❖ It provides an overlook to your farming field. \n❖ It provides a normal,satellite and hybrid view of your field.\n❖ Also provides view of nearby cropping fields. \n",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  elevation: 30,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("lib/asset/satya.png",width: 160,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Regulations",style: GoogleFonts.zillaSlab(fontSize: 35 ,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("❖ Decision making resulting in policies and legislation is the core business of any government.\n❖ Having lists of applicable policies and regulations, and extracting any data they contain (such as lists of subsidies) can also be helpful.\n❖ Our App will show you Indian Government regulations in various states in india including some central regulations as well.\n",style: GoogleFonts.zillaSlab(fontSize: 18,),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('lib/asset/contact.jpg'),
                          ),


                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 165,
                                      child: Card(
                                        shadowColor: Colors.lightGreenAccent,
                                        elevation: 20,
                                        child: Image.network("https://i.pinimg.com/originals/df/3d/af/df3daf9a9cb72b1c6b5f2e52846c2240.jpg",height: 100,width: 100,),
                                      ),
                                    ),
                                    Container(
                                      width: 165,
                                      child: Card(
                                        shadowColor: Colors.lightGreenAccent,
                                        elevation: 20,
                                        child: Image.network("https://www.bresslercompany.com/wp-content/uploads/2014/02/Linked-In.png",height: 100,width: 100,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 165,
                                      child: Card(
                                        shadowColor: Colors.lightGreenAccent,
                                        elevation: 20,
                                        child: Image.network("https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",height: 100,width: 100,),
                                      ),
                                    ),
                                    Container(
                                      width: 165,
                                      child: Card(
                                        shadowColor: Colors.lightGreenAccent,
                                        elevation: 20,
                                        child: Image.network("https://1.bp.blogspot.com/-CYDSHib_wQY/X5G7l5LqTDI/AAAAAAAAklg/uJxZb4zeb0EXG_Rle2xUJGeVT7dzPUHDQCLcBGAsYHQ/s2048/Gmail%2Bnew%2BLogo%2B2020.webp",height: 100,width: 100,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ),



              Image.asset("lib/asset/logo.jpg"),
            ],
          ),
        ),

          ],

        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          backgroundColor: Colors.lightGreenAccent,// this will be set when a new tab is tapped
          items: [

            BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/");
              },child: new Icon(Icons.home)),
              title: InkWell(onTap:(){
                Navigator.pushReplacementNamed(context, "/");
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
      ),
    );
  }
  Future signOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, "/login");
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
