
import 'package:bilili/connexion/login/repository.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';







import '../inscription/screen.dart';
import '../lancement/screen_lancement.dart';
import 'login_bloc.dart';




bool password=true;

//recuperation des valeurs des champs
TextEditingController ctrlPassword= TextEditingController();
TextEditingController ctrlconfPassword= TextEditingController();
TextEditingController ctrNom= TextEditingController();
TextEditingController ctrPrenom= TextEditingController();
TextEditingController ctrMail= TextEditingController();



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool login=false;
  String? response ;
  final _formKey= GlobalKey<FormState>();

  @override
  // construction du formulaire
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginRepo()),
        child: Scaffold(

          body: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
               if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoginError) {
                  return const Center(child: Text("Error"),);
                } else {
                  return buildInitialLayout();
                }
              }

          ),
        ));


  }








  void verlogin() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      // ignore: unnecessary_new
      return const MyApps();
    }));
  }

  Widget buildInitialLayout() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const SizedBox(height: 120.0),


            Image.asset(
              'assets/images/pras-system-logo-final-1.png',
              width: 150,
              height: 60,
            ),
            const SizedBox(height: 40.0),
            Center(

              child: Text('Se connecter à votre compte',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium),

            ),

            const SizedBox(height: 30),
            SizedBox(
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
                      .circular(30), borderSide: const BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                      width: 2.0)),
                ),
              ),

            ),
            const SizedBox(height: 20,),
            SizedBox(
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
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 2.0)),

                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        password = !password;
                      });
                    }, icon: Icon(password ? Icons.visibility : Icons
                        .visibility_off), iconSize: 25.0,)

                ),
                obscureText: password,


              ),
            ),


            const SizedBox(height: 30.0),

            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(280, 40),
                    backgroundColor: Colors.purple,
                    textStyle: const TextStyle(fontSize: 25),
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  onPressed: () async {

                    if(_formKey.currentState!.validate()){

                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        // ignore: unnecessary_new
                        return const Login();
                      }));
                    }

                  },


                  child: const Text(
                    'Se connecter', textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),),
                );
              },
            ),

            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Créer un compte ? ",
                  style: TextStyle(fontSize: 13, color: Colors.grey),),
                // ignore: deprecated_member_use
                TextButton(onPressed: () {

                  PageInscription();

                }, child: const Text("S´inscrire", style: TextStyle(
                  fontSize: 15, color: Colors.purple,),)),

              ],
            ),
          ],
        ),
      ),
    );
  }




  void PageInscription() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      // ignore: unnecessary_new
      return const Inscription();
    }));
  }
}
