import 'dart:convert';

import 'package:agriease/pages/mandidata.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Mandistate extends StatefulWidget {
  @override
  _MandistateState createState() => _MandistateState();
}

class _MandistateState extends State<Mandistate> {

  void setup(var query) async{
    print(query);
    var temp={};
    int k=0;
    mandidata instance =mandidata();
    await instance.getdata();

    for(int i=0;i<instance.list.length;i++){
      if(instance.list[i]["state"]==query){
        temp[k]=instance.list[i];
        k++;
      }
    }
    Navigator.pushNamed(context, "/mandi", arguments: {
      'info':temp,
      'name':query
    });
    print(temp);


  }


  @override
  Widget build(BuildContext context) {
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

              flexibleSpace:FlexibleSpaceBar(title: Text('Market States',style: GoogleFonts.zillaSlab(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.green[900],
                        child: InkWell(
                          onTap: (){
                            setup("Andhra Pradesh");
                          },
                          child: Card(
                            elevation: 30,
                            shadowColor: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Andhra Pradesh",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                            )),
                          ),
                        ),
                      ),
                    ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Chattisgarh");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Chattisgarh",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Gujarat");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Gujarat",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Haryana");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Haryana",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Himachal Pradesh");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Himachal Pradesh",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Jammu and Kashmir");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Text("Jammu and Kashmir",style: GoogleFonts.zillaSlab(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Karnataka");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Karnataka",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Kerala");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Kerala",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Madhya Pradesh");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Madhya Pradesh",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Maharashtra");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Maharashtra",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("NCT of Delhi");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("NCT of Delhi",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Odisha");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Odisha",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Pondicherry");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Pondicherry",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Punjab");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Punjab",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Rajasthan");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Rajasthan",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Tamil Nadu");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Tamil Nadu",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Telangana");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Telangana",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Tripura");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Tripura",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Uttar Pradesh");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Uttar Pradesh",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("Uttrakhand");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Uttrakhand",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green[900],
                      child: InkWell(
                        onTap: (){
                          setup("West Bengal");
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("West Bengal",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                          )),
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
