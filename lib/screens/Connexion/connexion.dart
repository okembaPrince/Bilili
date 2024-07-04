import 'package:bilili/main.dart';
import 'package:bilili/screens/inscription/inscription.dart';
import 'package:bilili/screens/lancement/presentation.dart';
import 'package:bilili/screens/menu/menu.dart';
import 'package:bilili/screens/renitialisation/numero.dart';

import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}


class _ConnexionState extends State<Connexion> {


  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  final _focusPassword = FocusNode();
  bool focusPassword=false;




  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });

    _focusPassword.addListener(() {
      setState(() {
        focusPassword = _focusPassword.hasFocus;
      });
    });

  }

  @override
  void dispose() {
    _focusNode.dispose();
    _focusPassword.dispose();
    TextEditingController().dispose();
    super.dispose();
  }


  bool password=true;

//recuperation des valeurs des champs
  TextEditingController ctrlPassword= TextEditingController();
  TextEditingController ctrlconfPassword= TextEditingController();
  TextEditingController ctrNumero= TextEditingController();


  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            children: [
              SizedBox(height: 90,),

              logo(),
              SizedBox(height: 30,),
              Text("Connectez-Vous",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),

              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Téléphone",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 1),
                        focusNode: _focusNode,
                        controller: ctrNumero,
                        cursorErrorColor: c_rouge,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value== null){
                            return "Entrez votre numéro de téléphone";

                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: c_gris, width: 0, style: BorderStyle.none )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: c_gris, width: 2, style: BorderStyle.solid )
                          ),

                          errorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: c_gris,style: BorderStyle.none,width: 0),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: c_gris, width: 0, style: BorderStyle.none )
                          ),

                          fillColor: Colors.grey[300],
                          filled: !isFocused,
                        ),

                      ),

                      SizedBox(height: 25,),
                      Text("Mot de passe",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 1),
                        focusNode: _focusPassword,
                        controller: ctrlPassword,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Entrez votre mot de passe";

                          } if(value.isNotEmpty && value.length <=3){
                            return "Le mot de passe est très court";

                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: c_gris, width: 0, style: BorderStyle.none )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: c_gris, width: 2, style: BorderStyle.solid)
                            ),

                            errorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: c_gris,style: BorderStyle.none,width: 0),
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: c_gris, width: 0, style: BorderStyle.none )
                            ),




                            fillColor: Colors.grey[300],
                            filled: !focusPassword,

                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                password=!password;
                              });

                            }, icon: Icon(password ? Icons.visibility : Icons
                                .visibility_off), iconSize: 25.0)
                        ),
                        obscureText: password,

                      ),

                      ListTile(
                        trailing: const Text("Mot de passe oublié ?",style: TextStyle(color: c_bleu),),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            // ignore: unnecessary_new
                            return const RnNumero();
                          }));
                        },
                      )

                    ],
                  )),

              SizedBox(height: 45,),
              Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(280, 48),
                      backgroundColor: c_bleu,
                      textStyle: const TextStyle(fontSize: 25),

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          // ignore: unnecessary_new
                          return const Menu();
                        }));

                      }

                    },


                    child: const Text(
                      'Connexion', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
                  ),

                  const SizedBox(height: 25),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("vous n'avez pas de compte ?",
                        style: TextStyle(fontSize: 13, color: c_noir),),
                      // ignore: deprecated_member_use
                      TextButton(onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          // ignore: unnecessary_new
                          return const Inscrir();
                        }));

                      }, child: const Text("créer", style: TextStyle(
                        fontSize: 15, color: c_bleu,),)),

                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
