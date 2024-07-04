import 'package:flutter/material.dart';

import '../../../main.dart';

class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  TextEditingController ctrlText=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Messagerie",style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(icon: const Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
        },),
        actions: const [
          Icon(Icons.notifications_none_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 8,top: 8),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(height: 0),
              controller: ctrlText,
              cursorColor: c_gris,

              keyboardType: TextInputType.text,

              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  const BorderSide(
                          color: c_gris, width: 1, style: BorderStyle.solid )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: c_gris, width: 2, style: BorderStyle.solid)
                  ),

                  errorBorder:  OutlineInputBorder(borderSide:  const BorderSide(color: c_gris,style: BorderStyle.solid,width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: c_gris, width: 0, style: BorderStyle.none )
                  ),



                  hintStyle: TextStyle(color: c_gris[300]),
                  hintText: "Recherches",


                  prefixIcon: IconButton(

                    onPressed: () {
                      setState(() {

                      });

                    }, icon:  const Icon(Icons.search),color: c_gris,)
              ),

            ),
            const SizedBox(height: 15),
            const Text("Actualités",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 10),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage("asset/img/eneo.png"),),
                  Column(children: [
                    Text("Eneo",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("3h ago",style: TextStyle(fontSize: 12),)
                  ],),
                  SizedBox(width: 10,),

                  CircleAvatar(backgroundImage: AssetImage("asset/img/camwater.jpg"),),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Camwater",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("5h ago",style: TextStyle(fontSize: 12),)
                  ],),
                  SizedBox(width: 10,),

                  CircleAvatar(backgroundImage: AssetImage("asset/img/camwater.jpg"),),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Isacam",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("9h ago",style: TextStyle(fontSize: 12),)
                  ],)
                  
                  
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text("Tous les messages",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
             const ListTile(contentPadding: EdgeInsets.symmetric(horizontal: -30),
               leading:  CircleAvatar(backgroundImage: AssetImage("asset/img/camwater.jpg"),),
               title: Text("SMS Camwater",style: TextStyle(fontWeight: FontWeight.bold),),
               subtitle: Text("Image envoyé",style: TextStyle(fontSize: 12),),
               trailing: CircleAvatar(backgroundColor: c_bleu,radius: 15,
               child: Text("3",style: TextStyle(color: c_blanc,fontSize: 12),),),
             ),

            const ListTile(contentPadding: EdgeInsets.symmetric(horizontal: -30),
              leading:  CircleAvatar(backgroundImage: AssetImage("asset/img/eneo.png"),),
              title: Text("SMS Eneo",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("Image envoyé",style: TextStyle(fontSize: 12),),
              trailing: CircleAvatar(backgroundColor: c_bleu,radius: 15,
                child: Text("1",style: TextStyle(color: c_blanc,fontSize: 12),),),
            ),

          ],
        ),
      ),
    );
  }
}
