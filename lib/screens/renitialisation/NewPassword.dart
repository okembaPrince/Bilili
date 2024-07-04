import 'package:bilili/main.dart';
import 'package:bilili/screens/Connexion/connexion.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class RnConfirmation extends StatefulWidget {
  const RnConfirmation({super.key});

  @override
  State<RnConfirmation> createState() => _RnConfirmationState();
}


class _RnConfirmationState extends State<RnConfirmation> {



  final _focusPassword = FocusNode();
  bool focusPassword=false;

  final _focusConfirmPassword = FocusNode();
  bool focusConfirmPassword=false;


  @override
  void initState() {
    super.initState();

    _focusPassword.addListener(() {
      setState(() {
        focusPassword = _focusPassword.hasFocus;
      });
    });

    _focusConfirmPassword.addListener(() {
      setState(() {
        focusConfirmPassword = _focusConfirmPassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();
    TextEditingController().dispose();
    super.dispose();
  }

  bool password=true;

//recuperation des valeurs des champs
  TextEditingController ctrlPassword= TextEditingController();
  TextEditingController ctrlconfPassword= TextEditingController();



  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              const Text("Réinitialisation",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text("Nouveau mot de passe",style: TextStyle(fontSize: 17),),
              SizedBox(height: 30,),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mot de passe",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 8,),
                      TextFormField(
                        style: const TextStyle(height: 1),
                        focusNode: _focusPassword,
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

                      SizedBox(height: 25,),
                      Text("Confirmation",style: TextStyle(fontSize: 17),),
                      SizedBox(height: 8,),
                      TextFormField(
                        style: const TextStyle(height: 0),
                        focusNode: _focusConfirmPassword,
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
                          filled: !focusConfirmPassword,
                        ),

                      ),

                    ],
                  )),

              SizedBox(height: 270,),
              Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 48),
                      backgroundColor: c_bleu,
                      textStyle: const TextStyle(fontSize: 25),

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState!.validate()){

                        AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.success,
                            title: "Information",
                            body: const Center(
                              child: Text('Mot de passe réinitialisé !',
                                style: TextStyle(fontStyle: FontStyle.italic,),),
                            ),
                            btnOkOnPress: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Connexion()),
                              );
                            }
                        ).show();

                      }

                    },

                    child: const Text(
                      'Enregistrer', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
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
