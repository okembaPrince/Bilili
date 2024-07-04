import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:bilili/connexion/inscription/repository.dart';
import 'package:flutter/material.dart';

import '../login/screen.dart';
import 'inscription_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'model.dart';

final String correctCode = "123456"; // Code correct
String enteredCode = ""; // Code entré par l'utilisateur

var errorNom, errorPrenom, errorEmail, errorPassword;
bool password=true;

//recuperation des valeurs des champs
TextEditingController ctrlPassword= TextEditingController();
TextEditingController ctrlconfPassword= TextEditingController();
TextEditingController ctrNom= TextEditingController();
TextEditingController ctrPrenom= TextEditingController();
TextEditingController ctrMail= TextEditingController();



class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool login=false;
  String? response ;
  final _formKey= GlobalKey<FormState>();

  @override
  // construction du formulaire
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<InscriptionBloc>(
  create: (context) => InscriptionBloc(InscriptionRepo()),
  child: Scaffold(

      body: BlocConsumer<InscriptionBloc, InscriptionState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if (state is InscriptionLoaded) {
      return buildLoadedlayout(state.data);
    } else if (state is InscriptionLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is InscriptionError) {
      return const Center(child: Text("Error"),);
    } else {
      return buildInitialLayout();
    }
  }

),
    ));


  }








  void PageLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      // ignore: unnecessary_new
      return const Login();
    }));
  }

  Widget buildInitialLayout() {
    return SingleChildScrollView(
        child: Form(
        key: _formKey,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              const SizedBox(height: 90.0),
              Container(

                child: Image.asset(
                  'assets/images/pras-system-logo-final-1.png',
                  width: 150,
                  height: 60,
                ),
              ),


              const SizedBox(height: 40.0),
              Center(

                child: Text('Créer votre compte',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),

              ),


              const SizedBox(height: 30),
              Container(
                width: 300,
                child: TextFormField(
                  style: const TextStyle(fontSize: 15),
                  controller: ctrNom,
                  validator: (value){
                    if (value == "") {
                      return "Veillez entrer votre Nom";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.deepPurple,width: 1,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 2,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: "Nom",

                    labelStyle: const TextStyle(fontSize: 20, color: Colors
                        .grey),

                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(20), borderSide: const BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 2.0)),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: 300,
                child: TextFormField(
                  style: const TextStyle(fontSize: 15),
                  controller: ctrPrenom,
                  validator: (value){
                    if (value == "") {
                      return "Veillez entrer votre prenom";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple,width: 1,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 2,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 0
                    ),
                    labelText: 'Prénom',
                    errorText: errorPrenom,
                    labelStyle: const TextStyle(fontSize: 17, color: Colors
                        .grey,),
                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(20), borderSide: const BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 2.0)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 300,
                child:
                TextFormField(
                  style: const TextStyle(fontSize: 15),
                  controller: ctrMail,
                  validator: (value) {
                    if (value == "" || !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$").hasMatch(value!)) {
                      return  "Veillez entrer votre adresse adresse E-mail";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple,width: 1,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 2,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'E-mail',
                    errorText: errorEmail,
                    labelStyle: const TextStyle(fontSize: 17, color: Colors
                        .grey),
                    border: OutlineInputBorder(borderRadius: BorderRadius
                        .circular(20), borderSide: const BorderSide(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 2.0)),
                  ),
                ),

              ),
              const SizedBox(height: 15,),
              Container(
                width: 300,
                child: TextFormField(
                  style: const TextStyle(fontSize: 15),
                  controller: ctrlPassword,
                  validator: (value) {
                    if (ctrlPassword.text == "" ||
                        ctrlPassword.text.length < 6) {
                      return "Veillez entrer votre mot de passe";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 1,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 2,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),

                      ),

                      labelText: 'Mot de passe',
                      errorText: errorPassword,
                      labelStyle: const TextStyle(
                        fontSize: 17, color: Colors.grey,),
                      border: OutlineInputBorder(borderRadius: BorderRadius
                          .circular(30), borderSide: const BorderSide(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 2.0)),

                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          password = !password;
                        });
                      }, icon: Icon(password ? Icons.visibility : Icons
                          .visibility_off), iconSize: 25.0,color: Colors.purple,)

                  ),
                  obscureText: password,


                ),
              ),


              const SizedBox(height: 30.0),

              BlocBuilder<InscriptionBloc, InscriptionState>(
                builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(280, 40),
                  backgroundColor: Colors.deepPurple,
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                onPressed: () async {

                  if(_formKey.currentState!.validate()){
                    bool result = await InternetConnectionChecker().hasConnection;
                    if(result == true) {
                      BlocProvider.of<InscriptionBloc>(context).add(SendData(ctrNom.text,ctrPrenom.text,ctrMail.text,ctrlPassword.text));

                    } else {
                      _smsInternet();

                    }

                  }

                },


                child: const Text(
                  'S´inscrire', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),),
              );
  },
),

              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   const Login())
                    );
                  },child: const Text("Avez-vous un compte ? ", style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                  // ignore: deprecated_member_use
                  TextButton(onPressed: () {

                    PageLogin();

                  }, child: const Text("Se connecter", style: TextStyle(
                    fontSize: 15, color: Color(0xFF0D588B),),)),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoadedlayout(InscriptionModel data) {


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Entrez le code à 6 chiffres :',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
                  (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          enteredCode += value;
                          if (enteredCode.length > 6) {
                            enteredCode = enteredCode.substring(0, 6);
                          }
                          enteredCode = enteredCode.substring(0, 6);
                        }
                      });
                      if (enteredCode.length >= 6) {

                        if (enteredCode == correctCode) {
                          // afficher le message que le code est réussi
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.success,
                            body: const Center(
                              child: Text(
                              'Vérification réussi !',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),),
                            title: 'Vérication',
                            desc:   'This is also Ignored',
                            btnOkOnPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                          ).show();

                          // Si le code est correct, naviguer vers une autre page

                        } else {
                          // Si le code est incorrect, réinitialiser le code entré
                          setState(() {
                            enteredCode = "";
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Code incorrect. Veuillez réessayer.'),
                            ));
                          });
                        }

                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // afficher le message en cas de manque de connexion internet lors de l'envoi du formulaire
  void _smsInternet(){
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Connexion Internet!',
      message:"Veiller vous connecter à internet avant de cliquer sur le boutant s'inscrire.",

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(snackBar);
  }

  // Fonction pour vérifier le code entré
}

// Page à laquelle l'utilisateur est navigué après avoir entré le bon code
class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autre page'),
      ),
      body: Center(
        child: Text('Vous avez entré le bon code !'),
      ),
    );
  }
}


