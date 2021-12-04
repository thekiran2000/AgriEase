import 'package:agriease/pages/weatherdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';



class Rainfinal extends StatefulWidget {
  @override
  _RainfinalState createState() => _RainfinalState();
}

class _RainfinalState extends State<Rainfinal> {
  Map datar={};
  var finalinfo;




  @override
  Widget build(BuildContext context) {
    datar=ModalRoute.of(context).settings.arguments;
    finalinfo=datar['finalinfo'];
    print(finalinfo);

    Map<String, double> dataMap = {
      "JAN": (double.parse('${finalinfo['JAN']}')),
      "FEB": (double.parse('${finalinfo['FEB']}')),
      "MAR": (double.parse('${finalinfo['MAR']}')),
      "APR": (double.parse('${finalinfo['APR']}')),
      "MAY": (double.parse('${finalinfo['MAY']}')),
      "JUN": (double.parse('${finalinfo['JUN']}')),
      "JUL": (double.parse('${finalinfo['JUL']}')),
      "AUG": (double.parse('${finalinfo['AUG']}')),
      "SEP": (double.parse('${finalinfo['SEP']}')),
      "OCT": (double.parse('${finalinfo['OCT']}')),
      "NOV": (double.parse('${finalinfo['NOV']}')),
      "DEC": (double.parse('${finalinfo['DEC']}')),


    };




    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[

            SliverAppBar(


              expandedHeight: 130.0,
              backgroundColor: Colors.lightGreenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50)),
              ),

              flexibleSpace:FlexibleSpaceBar(title: Text('Agriease \n Rainfall',style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),centerTitle: true,),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.green[900],
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 30,
                          shadowColor: Colors.lightGreenAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("lib/asset/Rain.jpg",width: 140,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("Annual",style: GoogleFonts.zillaSlab(fontSize: 40,fontWeight:FontWeight.bold,color: Colors.green[900]),),
                                    Text("Rainfall",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight:FontWeight.bold,color: Colors.green[900]),),
                                    Text("${finalinfo['ANNUAL']} mm",style: GoogleFonts.zillaSlab(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.green[900]),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.amberAccent[100],
                        elevation: 30,
                        shadowColor: Colors.lightGreenAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            child: PieChart(
                              dataMap: dataMap,
                              animationDuration: Duration(milliseconds: 1100),
                              chartLegendSpacing: 50,
                              chartRadius: MediaQuery.of(context).size.width / 1.6,
                              colorList: [Colors.amber,Colors.tealAccent,Colors.redAccent[400],Colors.lightGreenAccent,Colors.blueAccent,Colors.cyanAccent,Colors.pink,Colors.purpleAccent,Colors.grey,Colors.indigoAccent,Colors.yellowAccent,Colors.brown],
                              initialAngleInDegree: 0,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 65,
                              centerText: "Rainfall by month",
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: GoogleFonts.zillaSlab(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,

                                showChartValuesInPercentage: false,
                                showChartValuesOutside: true,
                                chartValueBackgroundColor: Colors.transparent,
                                chartValueStyle: GoogleFonts.zillaSlab(fontSize: 0),
                                decimalPlaces: 0,

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: Text('RainFall Interval',style: GoogleFonts.zillaSlab(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green[900],),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: Colors.green[900],
                                width: 170,
                                height: 140,
                                child: Card(

                                  elevation: 30,
                                  shadowColor: Colors.lightGreenAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Jan-Feb Data",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      )),
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${finalinfo['Jan-Feb']}",style: GoogleFonts.zillaSlab(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  color: Colors.green[900],
                                  width: 170,
                                  height: 80,
                                  child: Card(

                                    elevation: 30,
                                    shadowColor: Colors.lightGreenAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Center(child: Text("Mar-May Data",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),)),
                                        Center(child: Text("${finalinfo['Mar-May']}",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),)),

                                      ],
                                    ),
                                  )
                              ),
                            )],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: Colors.green[900],
                                width: 170,
                                height: 80,
                                child: Card(

                                  elevation: 30,
                                  shadowColor: Colors.lightGreenAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(child: Text("Jun-Sep Data",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),)),
                                      Center(child: Text("${finalinfo['Jun-Sep']}",style: GoogleFonts.zillaSlab(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: Colors.green[900],
                                width: 170,
                                height: 140,
                                child: Card(

                                  elevation: 30,
                                  shadowColor: Colors.lightGreenAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Oct-Dec Data",style: GoogleFonts.zillaSlab(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      )),
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${finalinfo['Oct-Dec']}",style: GoogleFonts.zillaSlab(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,)


                  ]
              ),

            ),
          ]

      ),

    );
  }
}


