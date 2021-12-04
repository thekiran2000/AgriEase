import 'dart:convert';

import 'package:agriease/pages/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Fianance extends StatefulWidget {
  @override
  _FiananceState createState() => _FiananceState();
}

class _FiananceState extends State<Fianance> {






  var _visible=false;



//  var dataa;
//  void vvv()async{
//    final User user1 = FirebaseAuth.instance.currentUser;
//    var a,b,c,d,m,f,g,h,i,j,k,l;
//
//
//
//    try{
//      final snapShot2 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Seeds").get();
//      a= snapShot2.data()["Spend"];
//    }catch(e){
//      a=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Fertilizers").get();
//      b= snapShot3.data()["Spend"];
//    }catch(e){
//      b=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Pesticides").get();
//      c= snapShot3.data()["Spend"];
//    }catch(e){
//      c=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Equipments").get();
//      d= snapShot3.data()["Spend"];
//    }catch(e){
//      d=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Electricity bill").get();
//      m= snapShot3.data()["Spend"];
//    }catch(e){
//      m=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("water bill").get();
//      f= snapShot3.data()["Spend"];
//    }catch(e){
//      f=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Maintainance").get();
//      g= snapShot3.data()["Spend"];
//    }catch(e){
//      g=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Health").get();
//      h= snapShot3.data()["Spend"];
//    }catch(e){
//      h=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Household").get();
//      i= snapShot3.data()["Spend"];
//    }catch(e){
//      i=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Animal food").get();
//      j= snapShot3.data()["Spend"];
//    }catch(e){
//      j=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Vehicles Fuel").get();
//      k= snapShot3.data()["Spend"];
//    }catch(e){
//      k=0.0;
//    }
//    try{
//      final snapShot3 = await FirebaseFirestore.instance.collection('${user1.email}').doc("Others").get();
//      l= snapShot3.data()["Spend"];
//    }catch(e){
//      l=0.0;
//    }
//
//
//
//    Map<String, double> dataMap = {
//      "Seeds": a,
//      "Fertilizers": b,
//      "Pesticides": c,
//      "Equipments": d,
//      "Electricity bill": m,
//      "Water bill": f,
//      "Maintainance": g,
//      "Health": h,
//      "Household": i,
//      "Animal food": j,
//      "Vehicle Fuel": k,
//      "Others": l,
//    };
//
//    setState(() {
//      dataa=dataMap;
//
//    });
//
//
//
//  }
String dropdownValue = 'Seeds';
var amount;
var spendfield;
var result={};
var resultlist=[];
var forlist;

var flag=0;
var kk;
var finaldict={};



final databaseReference = FirebaseFirestore.instance;
final User user = FirebaseAuth.instance.currentUser;

void createRecord(var spendtype,var amount) async {
  final User user = FirebaseAuth.instance.currentUser;

  final snapShot = await FirebaseFirestore.instance.collection('${user.email}').doc("$spendtype").get();

  if (snapShot.exists){
    var extra=amount;
    try{
      extra=extra+snapShot.data()["Spend"];
      await databaseReference.collection("${user.email}")
          .doc("$spendtype")
          .update({
        'Spend_type': spendtype,
        'Spend': extra
      });
    }
    catch(e){

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("ERROR OCCURED!!!",style: GoogleFonts.zillaSlab(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.red[400]),)),
              content: Text("Invalid Input",style: GoogleFonts.zillaSlab(fontSize: 23,fontWeight: FontWeight.bold),),
              actions: [
                FlatButton(
                  child: Text("Ok",style: GoogleFonts.zillaSlab(fontSize: 22,fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }


  }

  else{
    await databaseReference.collection("${user.email}")
        .doc("$spendtype")
        .set({
      'Spend_type': spendtype,
      'Spend': amount
    });

  }


}


  List<charts.Series<Task, String>> _seriesPieData;
  List<Task> mydata;
  _generateData(mydata) {

    _seriesPieData = List<charts.Series<Task, String>>();
//    List k=["0xFF42A5F5","0xFFFFFFFF"];
//    int i=0;

    _seriesPieData.add(

      charts.Series(

        domainFn: (Task task, _) => task.taskDetails,
        measureFn: (Task task, _) => task.taskVal,
//        colorFn: (Task task, _) =>
//
//            charts.ColorUtil.fromDartColor(Color(int.parse("${k[(i)%(k.length)]}"))),
        id: 'tasks',
        data: mydata,
        labelAccessorFn: (Task row, _) => "${row.taskVal}",
      ),
    );
  }
  double total = 0.0;

  @override
  initState() {
    super.initState();
    queryValues();
  }

  void queryValues() {
    FirebaseFirestore.instance
        .collection('${user.email}')
        .snapshots()
        .listen((snapshot) {
      double tempTotal = snapshot.docs.fold(0, (tot, doc) => tot + doc.data()["Spend"]);
      setState(() {total = tempTotal;});
      debugPrint(total.toString());
    });
  }




















  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Fianance",style: GoogleFonts.zillaSlab(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green[900]),),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26,10,26,1),
          child: Column(

            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8,8,1),
                child: Container(
                  color: Colors.indigo[700],
                  child: Card(

                    elevation: 20,
                    shadowColor: Colors.lightGreenAccent[200],
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Text("Spend fields",style: GoogleFonts.zillaSlab(color: Colors.indigo[900],fontWeight: FontWeight.bold,fontSize: 28),),
                          SizedBox(height: 5,),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: GoogleFonts.zillaSlab(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 22),
                            underline: Container(

                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Seeds', 'Fertilizers', 'Pesticides', 'Equipments','Electricity bill','Water bill','Maintainance','Health','Household','Animal food','Vehicles Fuel','Others']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),

                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,8,8),
                child: Container(
                  color: Colors.indigo[700],
                  child: Column(
                    children: [
                      Container(
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.lightGreenAccent,
                          child: Form(

                              child: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Text("Spend",style:GoogleFonts.zillaSlab(color: Colors.indigo[900],fontSize: 28,fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 3,

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(

                                          onFieldSubmitted: (value){
                                            setState(() {
                                                try {
                                                  amount = double.parse(value);
                                                }
                                                catch(e){
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Center(child: Text("ERROR OCCURED!!!",style: GoogleFonts.zillaSlab(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.red[400]),)),
                                                          content: Text("Invalid Input",style: GoogleFonts.zillaSlab(fontSize: 23,fontWeight: FontWeight.bold),),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text("Ok",style: GoogleFonts.zillaSlab(fontSize: 22,fontWeight: FontWeight.bold),),
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      });
                                                }




                                            });
                                          },
                                          style: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),
                                          decoration: InputDecoration(

                                            hintText: "Enter amount..",
                                            hintStyle: GoogleFonts.zillaSlab(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[900]),



                                          ),


                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(height:46,width: 250,child: RaisedButton(color: Colors.pinkAccent,child:Text("Add",style: GoogleFonts.aladin(fontWeight: FontWeight.bold,letterSpacing: 1,fontSize: 24,color: Colors.indigo[900]),),
                                      onPressed:(){
                                        createRecord(dropdownValue,amount);
//                                      vvv();
                                      }))
                                  ,SizedBox(height: 10,),

                                ],
                              )),
                        ),
                      )

                    ],
                  ),
                ),
              ),

              SizedBox(height: 15,),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('${user.email}').snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),

                      shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          DocumentSnapshot documentSnapshot=snapshot.data.documents[index];
                          return Container(
                            color: Colors.amberAccent,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(documentSnapshot["Spend_type"],style: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.pink),),
                                    SizedBox(height: 6,),
                                    Text("₹ "+documentSnapshot["Spend"].toString(),style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.green[900]),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 15,),
                                        InkWell(
                                            onTap: (){
                                              FirebaseFirestore.instance.collection('${user.email}').doc(documentSnapshot["Spend_type"]).delete();
//                                              vvv();
                                            },
                                            child: Icon(Icons.delete_outline,color: Colors.red[600],size: 32,)),
                                      ],
                                    )
                                  ],

                                ),
                              ),
                            ),
                          );
                        }

                    );
                  }
                  if (!snapshot.hasData){
                    print('test phrase');
                    return Text("Loading.....");
                  }

                },

              ),
              SizedBox(height: 10,),
              Divider(thickness: 2,color: Colors.grey,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0,2,10,10),
                child: Container(
                  width: 290,
                  height: 100,
                  color: Colors.indigo[700],
                  child: Card(
                    elevation: 10,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("Total Spent",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink),),
                            Text("₹ ${total}",style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[800]),),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 690,

                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  elevation: 20,
                  color: Colors.amberAccent[100],

                    child: _buildBody(context)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
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
 Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('${user.email}').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return LinearProgressIndicator();
      } else {
        List<Task> task = snapshot.data.docs
            .map((documentSnapshot) => Task.fromMap(documentSnapshot.data()))
            .toList();
        return _buildChart(context, task);
      }
    },
  );
  }

  Widget _buildChart(BuildContext context, List<Task> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Pie Chart analysis',
                style: GoogleFonts.zillaSlab(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.green[800]),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 2),




                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,

                        desiredMaxRows: 12,
                        desiredMaxColumns: 1,



                        cellPadding:
                        new EdgeInsets.only(right: 4.0, bottom: 4.0,top:4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.black,
                            fontFamily: 'Georgia',
                            fontSize: 17),
                      ),

                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 80,
                              strokeWidthPx: 1,

                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside,


                          )
                        ])),

              ),
            ],
          ),
        ),
      ),
    );
  }






}
