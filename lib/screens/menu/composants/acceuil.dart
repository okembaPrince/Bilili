import 'package:bilili/main.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Actualités",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: const [
            Icon(Icons.notifications_none_outlined)
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: c_gris[300],

                        shape: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Padding(

                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: AssetImage("asset/img/eneo.png"),),
                                  Column(children: [
                                    Text("Eneo",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("      1h Publié",style: TextStyle(fontSize: 12),)
                                  ],)
                                ],
                              ),
                              SizedBox(height: 2,),
                              Text("travaux de maintenance ce Samedi 12 Septembre 2024",style: TextStyle(fontSize: 11),),
                              SizedBox(height: 2,),
                              Image(image: AssetImage("asset/img/Travaux-ENEO.png"),fit: BoxFit.fitWidth,height: 130,),
                              SizedBox(height: 2,),
                              Text(
                                "Eneo Cameroon S.A. est dédiée à l'excellence opérationnelle, réalisant des travaux de maintenance préventive et corrective pour assurer une distribution d'énergie constante et fiable.",
                                textAlign: TextAlign.justify,style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),

                      ),
                    ],),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: c_gris[300],

                        shape: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Padding(

                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: AssetImage("asset/img/camwater.jpg"),),
                                  Column(children: [
                                    Text("Camwater",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("12h Publié",style: TextStyle(fontSize: 12),)
                                  ],)
                                ],
                              ),
                              SizedBox(height: 2,),
                              Text("Distribution d'eau potable dans les zones périurbain",style: TextStyle(fontSize: 11),),
                              SizedBox(height: 2,),
                              Image(image: AssetImage("asset/img/camewater_distribution.jpg"),fit: BoxFit.fitWidth,height: 130,),
                              SizedBox(height: 2,),
                              Text(
                                "Camwater, l'opérateur national du Cameroun, assure avec rigueur la distribution d'eau potable en milieu urbain et périurbain. Engagée dans la gestion des infrastructures hydrauliques, Camwater veille à la production, au transport et à la fourniture d'eau, répondant ainsi aux besoins essentiels des communautés.",
                                textAlign: TextAlign.justify,style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),

                      ),
                    ],),
                ),
              ],
            )
        )
    );
  }
}
