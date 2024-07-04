import 'package:bilili/main.dart';
import 'package:bilili/screens/lancement/presentation.dart';
import'package:flutter/material.dart';








class Lancement extends StatefulWidget {
  const Lancement({Key? key}) : super(key: key);


  @override
  LancementState createState() => LancementState();
}

class LancementState extends State<Lancement> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /* saveUser(){
    UserService.registerUser();
  }*/

  bool stop=true;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 250) ,

          child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 20),

              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: logo()
                ),
              )
          ),
        )
    );
  }

  startTimer() async {
    await Future.delayed(const Duration(seconds: 15));
    stop=false;
    route();
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Presentation(),
        ));
  }

}

