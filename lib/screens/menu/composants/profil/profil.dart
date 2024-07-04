import 'package:bilili/main.dart';

import 'package:flutter/material.dart';

import 'modifier.dart';


class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.chevron_left),
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });

          },),
        title: const Text("Mon profile",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        
      ),
      body:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("asset/img/pichet.jpg"),
              radius: 30,),
              title: Text("Hardy OKEMBA",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("Sangmélima, Cameroun"),

            ),
            const SizedBox(height: 10,),
             const ListTile(
              leading: Text("Numéro",style: TextStyle(color: c_gris,fontSize: 17),),
              title: Text("653896788",style: TextStyle(color: c_noir,fontWeight: FontWeight.bold,fontSize: 17,),textAlign: TextAlign.center,),
            ),

            const ListTile(
              leading: Text("Né(e) le",style: TextStyle(color: c_gris,fontSize: 17),),
              title: Text("12-10-2005",style: TextStyle(color: c_noir,fontWeight: FontWeight.bold,fontSize: 17,),textAlign: TextAlign.center,),
            ),

            const ListTile(
              leading: Text("Genre",style: TextStyle(color: c_gris,fontSize: 17),),
              title: Text("Masculin",style: TextStyle(color: c_noir,fontWeight: FontWeight.bold,fontSize: 17,),textAlign: TextAlign.center,),
            ),

            const SizedBox(height: 40,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 48),
                backgroundColor: c_bleu,
                textStyle: const TextStyle(fontSize: 25),

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () async {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModifierProfil(),
                      ));
                });

              },


              child: const Text(
                'Modifier', textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
