
import 'package:bilili/main.dart';
import 'package:bilili/screens/inscription/inscription.dart';
import 'package:bilili/screens/lancement/lancement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => PresentationState();
}

class PresentationState extends State<Presentation> {

_pLogin(){
  Navigator.push(BuildContext as BuildContext, MaterialPageRoute(builder: (BuildContext context) {
    // ignore: unnecessary_new
    return const Inscrir();
  }));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OverBoard(
          allowScroll: true,
          pages: pages,
          showBullets: true,
          inactiveBulletColor: c_gris,
          activeBulletColor: c_noir,
          buttonColor: c_noir,
          skipText: "",
          nextText: "Suivant",
          finishText: "Fin",

          finishCallback: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Inscrir()),
              );
            });

          },
        )
    );
  }
}

final pages =[
  PageModel.withChild(
      doAnimateChild: true,
      color: c_blanc,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

        logo(),
          SizedBox(height: 80,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Nous intervenons",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
            Text("de partout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
            SizedBox(height: 20,),
            Text("Nous rejoindre, c’est s’adresser",style: TextStyle(color: Colors.grey,fontSize: 20)),
            Text("aux Concernés",style: TextStyle(color: Colors.grey,fontSize: 20)),
          ],),
        ),


      ],)),

  PageModel.withChild(
      doAnimateChild: true,
      color: c_blanc,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          logo(),
          SizedBox(height: 80,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Faites entendre",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
                Text("votre voix",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
                SizedBox(height: 20,),
                Text("Nous sommes à votre écoute",style: TextStyle(color: Colors.grey,fontSize: 20)),
                Text("et nous réagissons dans les",style: TextStyle(color: Colors.grey,fontSize: 20)),
                Text("minutes qui suivent",style: TextStyle(color: Colors.grey,fontSize: 20)),
              ],),
          ),


        ],)),

  PageModel.withChild(
      doAnimateChild: true,
      color: c_blanc,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          logo(),
          SizedBox(height: 80,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("C'est le moment",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
                Text("agissons ensemble",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27),),
                SizedBox(height: 20,),
                Text("Une image envoyée, un incident évité",style: TextStyle(color: Colors.grey,fontSize: 18,)),
                Text("et plusieurs vies sauvées",style: TextStyle(color: Colors.grey,fontSize: 18)),
              ],),
          ),


        ],)),
];