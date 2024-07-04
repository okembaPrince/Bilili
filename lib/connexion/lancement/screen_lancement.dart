import'package:flutter/material.dart';

import '../inscription/screen.dart';






class MyApps extends StatefulWidget {
  const MyApps({Key? key}) : super(key: key);


  @override
  MyAppsState createState() => MyAppsState();
}

class MyAppsState extends State<MyApps> {
  @override
  void initState() {
    super.initState();
    //saveUser();
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

              child: Column(
                  children:[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Image.asset('assets/images/pras-system-logo-final-1.png', height: MediaQuery.of(context).size.height/10, width: 150.0),
                      ),
                    ),


                    Container(

                      margin: const EdgeInsets.only(left: 50.0, right:50.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.blue[200],
                          color: const Color(0xFF20339B),
                          minHeight: 7,

                        ),
                      ),
                    ),

                  ]
              )
          ),
        )
    );
  }

  startTimer() async {
    await Future.delayed(const Duration(seconds: 20));
    stop=false;
    route();
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Inscription(),
        ));
  }

}

