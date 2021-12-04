import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';


class Crop1 extends StatefulWidget {

  @override
  _Crop1State createState() => _Crop1State();
}

class _Crop1State extends State<Crop1> {
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
  var dropdownValue1='Andaman and Nicobar Islands';
  var dropdownValue='2000';
  var state;
  var district;
  var year;

  var data={};
  var crop;
  var job;

//  var finallist=[];

  void setup(var i,var j,var m){
    var temp=[];

    for(int k=0;k<crop[i].length;k++){

      if(crop[i][k]["District_Name"]==j.toUpperCase()){
          job=crop[i][k]["Crop_Year"].toString();
          if(job==m.toString()){
            temp.add(crop[i][k]);
          }
      }
    }
    Navigator.pushNamed(context, "/crop1final",arguments: {
      'crop1final':temp,
    });

  }

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    crop=data['crop'];


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

              flexibleSpace:FlexibleSpaceBar(title: Text('Crop',style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,5,15,4),
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
                                        Text("State name:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10.0,2,10,0),
                                          child: Card(
                                            elevation: 8,
                                            child: DropdownButton<String>(
                                              value: dropdownValue1,
                                              icon: Icon(Icons.arrow_downward),
                                              iconSize: 17,
                                              elevation: 16,


                                              style: GoogleFonts.zillaSlab(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 19),
                                              underline: Container(
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              onChanged: (String newValue) {
                                                setState(() {
                                                  dropdownValue1 = newValue;

                                                });
                                              },
                                              items: <String>['Andaman and Nicobar Islands','Maharashtra', 'Assam', 'Arunachal Pradesh', 'Andhra Pradesh','Bihar','West Bengal'
                                                  ,'Manipur','Mizoram','Meghalaya','Tripura','Nagaland','Sikkim','Uttar Pradesh','Uttarakhand','Punjab','Haryana','Chhattisgarh',
                                                'Himachal Pradesh','Jammu and Kashmir ','Rajasthan','Madhya Pradesh','Jharkhand','Odisha','Gujarat','Telangana ',
                                                'Goa','Karnataka','Tamil Nadu','Kerala','Puducherry',]
                                                  .map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),

                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),SizedBox(height: 5,),
                                        Text("District name:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
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
                                                    district=value;

                                                  });
                                                },

                                                style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold),
                                                decoration: InputDecoration(

                                                  hintText: "Enter district name...",
                                                  hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,),),


                                              ),
                                            ),


                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text("Year:",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green[700]),),
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
                                              items: <String>['1997', '1998', '1999', '2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015']
                                                  .map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),

                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 5,),

                                        RaisedButton(
                                          onPressed: (){
                                            setup(dropdownValue1,district,dropdownValue);
                                            clearTextInput();
                                            setState(() {
//                                              kg=Final_output;
                                            });

                                          },
                                          color:Colors.lightBlueAccent ,
                                          child: Text("Submit",
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

                          SizedBox(height: 200,),
                        ],
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
