
import 'package:bilili/screens/Connexion/connexion.dart';
import 'package:bilili/screens/inscription/configuration_compte.dart';
import 'package:bilili/screens/lancement/lancement.dart';
import 'package:bilili/screens/menu/composants/camera.dart';
import 'package:bilili/screens/menu/composants/profil/modifier.dart';
import 'package:bilili/screens/menu/composants/sms.dart';
import 'package:bilili/screens/menu/menu.dart';
import 'package:bilili/screens/renitialisation/NewPassword.dart';
import 'package:bilili/screens/renitialisation/RnCode.dart';
import 'package:bilili/screens/renitialisation/numero.dart';
import 'package:bilili/screens/testLingala.dart';
import 'package:flutter/material.dart';
const c_noir= Colors.black;
const c_gris= Colors.grey;
const c_blanc= Colors.white;
const c_blanc70= Colors.white70;
const c_bleu= Colors.blue;
const c_rouge= Colors.redAccent;


Widget logo(){
  return Image.asset('asset/img/lancement.gif', height: 140, width: 150.0,);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(headlineLarge: TextStyle(color: Colors.black)),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),




        useMaterial3: true,
      ),
      home:  const Menu()
    );
  }
}


