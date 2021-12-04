
import 'package:agriease/pages/coviddata.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setup()async{
    coviddata inst=coviddata();
    await inst.getdata();
    await inst.getdata();


    Navigator.pushReplacementNamed(context, "/home");
//    print(inst.covid);


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(
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
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/asset/crop.gif',height: 180,width: 240,),
                SizedBox(height: 0,),
                Text('Agriease',style: GoogleFonts.zillaSlab(color: Colors.green[900],fontSize: 35

                    ,fontWeight: FontWeight.bold),),
              ],
            )),
      ),
    );
  }
}
