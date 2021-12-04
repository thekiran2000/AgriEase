

import 'package:agriease/pages/Raindistrict.dart';
import 'package:agriease/pages/Rainfinal.dart';
import 'package:agriease/pages/Rainstate.dart';

import 'package:agriease/pages/auth_service.dart';
import 'package:agriease/pages/calculator.dart';
import 'package:agriease/pages/crop.dart';
import 'package:agriease/pages/crop1.dart';
import 'package:agriease/pages/crop1final.dart';
import 'package:agriease/pages/crop2.dart';
import 'package:agriease/pages/crop2final.dart';
import 'package:agriease/pages/crop3.dart';
import 'package:agriease/pages/crop3final.dart';
import 'package:agriease/pages/fertifinal.dart';
import 'package:agriease/pages/fertilizer.dart';
import 'package:agriease/pages/fianance.dart';
import 'package:agriease/pages/home.dart';
import 'package:agriease/pages/laws.dart';
import 'package:agriease/pages/loading.dart';
import 'package:agriease/pages/login.dart';
import 'package:agriease/pages/mandi.dart';
import 'package:agriease/pages/mandistate.dart';
import 'package:agriease/pages/maps.dart';
import 'package:agriease/pages/signup.dart';
import 'package:agriease/pages/weatherhome.dart';
import 'package:agriease/pages/weatherhome2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<Auth_serve>(
          create: (_)=>Auth_serve(FirebaseAuth.instance),
      ),
      StreamProvider(create: (context)=> context.read<Auth_serve>().authStateChanges)
    ],
    child: MaterialApp(
      initialRoute: '/aoth',
      routes: {
        "/loading": (context)=>Loading(),
        "/home": (context)=>Home(),
        "/weatherhome": (context)=>Weatherhome(),
        "/weatherhome2": (context)=>Weatherhome2(),
        "/rainstate": (context)=>Rain_State(),
        "/rain_district": (context)=>Raindistrict(),
        "/rainfinal": (context)=>Rainfinal(),
        "/laws": (context)=>Laws(),
        "/crop": (context)=>Crop(),
        "/mandistate": (context)=>Mandistate(),
        "/mandi": (context)=>Mandi(),
        "/fertilizer": (context)=>Fertilizer(),
        "/fertifinal": (context)=>Fertifinal(),
        "/fianance": (context)=>Fianance(),
        "/calculator": (context)=>Calculator(),
        "/maps": (context)=>Maps(),
        "/crop1": (context)=>Crop1(),
        "/crop2": (context)=>Crop2(),
        "/crop3": (context)=>Crop3(),
        "/crop1final": (context)=>Crop1final(),
        "/crop2final": (context)=>Crop2final(),
        "/crop3final": (context)=>Crop3final(),
        "/login": (context)=>Login(),
        "/signup": (context)=>Signup(),
        "/aoth": (context)=>Aoth(),


      },
    ),
  ));
}

class Aoth extends StatelessWidget {

  const Aoth({
    Key key,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null){
      return Home();
    }

    else{
      return Login();
    }
  }
}
