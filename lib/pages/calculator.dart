import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var plant;
  var rowspace;
  var area;
  var temp;
  var quantity;

  var gg=0.0;
  var kg=0.0;

  var N;
  var P;
  var K;

  var N2=0.0;
  var P2=0.0;
  var K2=0.0;

  var dropdownValue='DAP';
  final nameHolder = TextEditingController();
  final nameHolder2 = TextEditingController();
  final nameHolder3 = TextEditingController();
  final nameHolder4 = TextEditingController();

  clearTextInput(){

    nameHolder.clear();
    nameHolder2.clear();
    nameHolder3.clear();
    nameHolder4.clear();

  }



  var cropname;
  var heads;
  var grains;
  var weight;
  var Final_output;

  void setup3(var i,var j,var k,var l){
    l=double.parse(l);
    j=double.parse(j);
    k=double.parse(k);

    Final_output=j*k*l;
    Final_output=Final_output/10000;

    Final_output=double.parse(Final_output.toStringAsFixed(4));
  }


  void setup(var i,var j,var k){
    i=double.parse(i);
    j=double.parse(j);
    k=double.parse(k);

    temp=k/(i*j);
    temp=double.parse(temp.toStringAsFixed(0));

    high=true;
    print(temp);




  }


  void setup2(var i,var j){

    j=double.parse(j);


    if(i=="DAP"){
      N=0.18*j;
      P=0.46*j;
      K=0.0*j;
    }

    else if(i=="SSP"){
      N=0.0*j;
      P=0.16*j;
      K=0.0*j;
    }
    else if(i=="MoP"){
      N=0.0*j;
      P=0.0*j;
      K=0.6*j;
    }

    else if(i=="UREA"){
      N=0.46*j;
      P=0.0*j;
      K=0.0*j;
    }
    else if(i=="Complex N.P.K.(10:26:26)"){
      N=0.1*j;
      P=0.26*j;
      K=0.26*j;
    }
    else if(i=="Complex N.P.K.(12-32-16)"){
      N=0.12*j;
      P=0.32*j;
      K=0.16*j;
    }

    N=double.parse(N.toStringAsFixed(2));
    P=double.parse(P.toStringAsFixed(2));
    K=double.parse(K.toStringAsFixed(2));
  }

  bool high=false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,

          appBar: AppBar(

            title: Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: Text("Calculators",style: GoogleFonts.zillaSlab(fontSize: 33,fontWeight: FontWeight.bold,color: Colors.green[900]),),
            ),
            toolbarHeight: 130,
            centerTitle: true,
            backgroundColor: Colors.lightGreenAccent[400],
            bottom: TabBar(
              tabs: [
                Tab(child: Text(" \t \t Plant\nPopulation",style: GoogleFonts.zillaSlab(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green[900]),),),
                Tab(child: Text(" \t \t  NPK\ncalculations",style: GoogleFonts.zillaSlab(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green[900]),),),
                Tab(child: Text(" \t \t  Yield\ncalculations",style: GoogleFonts.zillaSlab(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green[900]),),),
              ],
            ),

          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0,5,12,4),
                    child: Container(
                      color: Colors.green[900],
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation:30,
                          shadowColor: Colors.greenAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 5,),
                                Text("Plant Spacing:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: TextField(
                                        controller: nameHolder,
                                        onChanged: (value){
                                          setState(() {
                                            plant=value;

                                          });
                                        },
                                        style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                                        decoration: InputDecoration(

                                          hintText: "Plant spacing in metres",
                                          hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),


                                        ),

                                      ),
                                    ),
                                  ),
                                ),SizedBox(height: 5,),
                                Text("Row Spacing:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: TextField(
                                        controller: nameHolder2,
                                        onChanged: (value){
                                          setState(() {
                                            rowspace=value;
                                            value=" ";
                                          });

                                        },

                                        style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(

                                          hintText: "Row spacing in metres",
                                          hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),


                                        ),


                                      ),
                                    ),
                                  ),
                                ),SizedBox(height: 5,),
                                Text("Area:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: TextField(
                                        controller: nameHolder3,
                                        onChanged: (value){
                                          setState(() {
                                            area=value;
                                            value=" ";
                                          });
                                        },

                                        style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(

                                          hintText: "Area in metre square",
                                          hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),),


                                        ),
                                    ),


                                    ),
                                  ),


                                RaisedButton(
                                  onPressed: (){
                                    setup(plant,rowspace,area);
                                    clearTextInput();
                                    setState(() {
                                      gg=temp;
                                    });

                                  },
                                  color:Colors.lightBlueAccent ,
                                  child: Text("Calculate",
                                    style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 337,
                    color: Colors.green[900],
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

                            Text("No of plants:",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[700]),),
                            Text("${gg}",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Colors.green[900],
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation:30,
                          shadowColor: Colors.greenAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 5,),
                                Text("Fertilizer:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                  child: Card(
                                    elevation: 8,
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,


                                      style: GoogleFonts.zillaSlab(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 20),
                                      underline: Container(
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;

                                        });
                                      },
                                      items: <String>['DAP', 'SSP', 'UREA', 'MoP','Complex N.P.K.(10:26:26)','Complex N.P.K.(12-32-16)']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),

                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),SizedBox(height: 5,),
                                Text("Amount of fertilizer:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                  child: Card(
                                    elevation: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: nameHolder2,
                                        onChanged: (value){
                                          setState(() {
                                            quantity=value;

                                          });

                                        },

                                        style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(

                                          hintText: "Enter amount in KG",
                                          hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),


                                        ),


                                      ),
                                    ),
                                  ),
                                ),SizedBox(height: 5,),

                                RaisedButton(
                                  onPressed: (){
                                    setup2(dropdownValue,quantity);
                                    clearTextInput();
                                    setState(() {
                                      N2=N;
                                      P2=P;
                                      K2=K;
                                    });

                                  },
                                  color:Colors.lightBlueAccent ,
                                  child: Text("Calculate",
                                    style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green[900],
                    width: 337,
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

                            Text("NPK  Content :",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[900]),),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("Nitrogen",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[700]),),
                                    Text("${N2}",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Phosphorus",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[700]),),
                                    Text("${P2}",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),),
                                  ],
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                Text("Potasium",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.green[700]),),
                                Text("${K2}",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0,5,12,4),
                      child: Container(
                        color: Colors.green[900],
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation:30,
                            shadowColor: Colors.greenAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Text("Crop name:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextField(
                                          controller: nameHolder,
                                          onChanged: (value){
                                            setState(() {
                                              cropname=value;

                                            });
                                          },
                                          style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(

                                            hintText: "Enter crop name",
                                            hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),


                                          ),

                                        ),
                                      ),
                                    ),
                                  ),SizedBox(height: 5,),
                                  Text("heads/pods per m2:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextField(
                                          controller: nameHolder2,
                                          onChanged: (value){
                                            setState(() {
                                              heads=value;

                                            });

                                          },

                                          style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(

                                            hintText: "Enter value in meter square",
                                            hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),


                                          ),


                                        ),
                                      ),
                                    ),
                                  ),SizedBox(height: 5,),
                                  Text("Grains per head/pod :",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextField(
                                          controller: nameHolder3,
                                          onChanged: (value){
                                            setState(() {
                                              grains=value;
                                              value=" ";
                                            });
                                          },

                                          style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(

                                            hintText: "Enter number of..",
                                            hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),),


                                        ),
                                      ),


                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("Weight of 100 grains:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,2,10,4),
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextField(
                                          controller: nameHolder4,
                                          onChanged: (value){
                                            setState(() {
                                              weight=value;
                                              value=" ";
                                            });
                                          },

                                          style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(

                                            hintText: "Enter weight in gram",
                                            hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),),


                                        ),
                                      ),


                                    ),
                                  ),


                                  RaisedButton(
                                    onPressed: (){
                                      setup3(cropname,heads,grains,weight);
                                      clearTextInput();
                                      setState(() {
                                        kg=Final_output;
                                      });

                                    },
                                    color:Colors.lightBlueAccent ,
                                    child: Text("Calculate",
                                      style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 338,
                      child: Container(
                        color: Colors.green[900],
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

                                Text("Yield (Tonne/hectare) \nfor your crop ${cropname} is:",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green[700]),),
                                Text("${kg}\t\tt/ha",style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 30),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
