import 'package:bilili/main.dart';
import 'package:bilili/screens/inscription/configuration_compte.dart';
import 'package:bilili/screens/inscription/verification_numero.dart';
import 'package:bilili/screens/lancement/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inscrir extends StatefulWidget {
  const Inscrir({super.key});

  @override
  State<Inscrir> createState() => _InscrirState();
}


class _InscrirState extends State<Inscrir> {


  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  final _FocusPassword = FocusNode();
  bool _focusPassword=false;

  final _FocusConfirmPassword = FocusNode();
  bool _focusConfirmPassword=false;


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _FocusPassword.addListener(() {
      setState(() {
        _focusPassword = _FocusPassword.hasFocus;
      });
    });

    _FocusConfirmPassword.addListener(() {
      setState(() {
        _focusConfirmPassword = _FocusConfirmPassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _FocusPassword.dispose();
    _FocusConfirmPassword.dispose();
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
              SizedBox(height: 100,),
              Text("Création de compte",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Form(
                key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Entrez votre numéro",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 0),
                        focusNode: _focusNode,
                        controller: ctrNumero,
                        cursorErrorColor: c_rouge,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value== null){
                            return "Entrez votre numéro de téléphone";

                          } else if(value.length !=9){
                            return "Entrer un numéro correct (9 chiffres)";

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

                          hintText: "     +242  066000000",
                          hintStyle: TextStyle(color: c_gris,),
                          fillColor: Colors.grey[300],
                          filled: !_isFocused,
                        ),

                      ),

                      SizedBox(height: 25,),
                      Text("Mot de passe",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 1),
                        focusNode: _FocusPassword,
                        controller: ctrlPassword,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Entrer un mot de passe";

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



                          hintStyle: TextStyle(color: c_gris),
                          fillColor: Colors.grey[300],
                          filled: !_focusPassword,

                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              password=!password;
                            });

                          }, icon: Icon(password ? Icons.visibility : Icons
                              .visibility_off), iconSize: 25.0)
                        ),
                        obscureText: password,

                      ),

                      SizedBox(height: 25,),
                      Text("Confirmation",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 3,),
                     TextFormField(
                       style: const TextStyle(height: 0),
                       focusNode: _FocusConfirmPassword,
                       controller: ctrlconfPassword,
                       cursorErrorColor: c_rouge,
                       cursorColor: c_gris,
                       validator: (value){
                         if(value!.isEmpty){
                           return "Entrez le mot de passe";
                         }
                         if (ctrlPassword.text != ctrlconfPassword.text){
                           return "Mot de passe non identique";
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
                                 color: c_gris, width: 2, style: BorderStyle.solid )
                         ),

                         errorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: c_gris,style: BorderStyle.none,width: 0),
                         borderRadius: BorderRadius.circular(15)),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                             borderSide: const BorderSide(
                                 color: c_gris, width: 0, style: BorderStyle.none )
                         ),

                         hintStyle: TextStyle(color: c_gris),
                         fillColor: Colors.grey[300],
                         filled: !_focusConfirmPassword,

                       ),
                       obscureText: true,

                     ),

                    ],
                  )),

              SizedBox(height: 95,),
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
                          return const Numero();
                        }));

                      }

                    },


                    child: const Text(
                      'Suivant', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
                  ),

                  const SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Avez-vous un compte ? ",
                        style: TextStyle(fontSize: 13, color: c_noir),),
                      // ignore: deprecated_member_use
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          // ignore: unnecessary_new
                          return const Numero();
                        }));

                      }, child: const Text("Se connecter", style: TextStyle(
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
