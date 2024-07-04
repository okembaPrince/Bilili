import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

import '../login/screen.dart';

class Presentation extends StatefulWidget {
  Presentation ({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        body: OverBoard(
          allowScroll: true,
          pages: pages,
          showBullets: true,
          inactiveBulletColor: Colors.blue,



          // backgroundProvider: NetworkImage('https://picsum.photos/720/1280'),
          skipCallback: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(""),

            ));

            setState(() {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Login()),
                      (Route<dynamic> route) =>false);
            });
          },
          finishCallback: () {
            setState(() {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Login()),
                      (Route<dynamic> route) =>false);
            });

          },

        ),


      ),

    );
  }

  final pages = [


    PageModel.withChild(

      child: Container(

        padding: EdgeInsets.only(bottom: 1.0),

        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:50),
                child: Image.asset('assets/images/pras-system-logo-final-1.png',height:60)),

            Container(
                margin: EdgeInsets.only(top:2),
                child: Image.asset('assets/images/pa.jpeg', width: 350.0, height: 400.0)),
            Container(
                margin: EdgeInsets.only(top:0),
                padding: EdgeInsets.only(bottom:10),
                child:Text("Use PRAS System \n to control your home remotely",
                  style:TextStyle(fontSize:26,
                      color: Colors.white
                  ),
                  textAlign:TextAlign.center,
                )
            )
          ],
        ),

      ),



      color: const Color(0xFF5886d6),
      doAnimateChild: true,


    ),


    PageModel.withChild(

      child: Container(

        padding: EdgeInsets.only(bottom: 1.0),

        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:50),
                child: Image.asset('assets/images/pras-system-logo-final-1.png',height:60)),

            Container(
                margin: EdgeInsets.only(top:2),
                child: Image.asset('assets/images/Light.gif', width: 350.0, height: 400.0)),
            Container(
                margin: EdgeInsets.only(top:0),
                padding: EdgeInsets.only(bottom:10),
                child:Text("Guarantee the security of your home \n with PRAS System",
                  style:TextStyle(fontSize:26,
                      color: Colors.white
                  ),
                  textAlign:TextAlign.center,
                )
            )
          ],
        ),

      ),



      color: const Color(0xFF5886d6),
      doAnimateChild: true,


    ),


    PageModel.withChild(

      child: Container(

        padding: EdgeInsets.only(bottom: 1.0),

        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:50),
                child: Image.asset('assets/images/pras-system-logo-final-1.png',height:60)),

            Container(
                margin: EdgeInsets.only(top:2),
                child: Image.asset('assets/images/pc.jpeg', width: 350.0, height: 400.0)),
            Container(
                margin: EdgeInsets.only(top:0),
                padding: EdgeInsets.only(bottom:10),
                child:Text("Save your energy \n by planning your actions",
                  style:TextStyle(fontSize:26,
                      color: Colors.white
                  ),
                  textAlign:TextAlign.center,

                )
            )
          ],
        ),

      ),



      color: const Color(0xFF5886d6),
      doAnimateChild: true,


    ),

  ];
}
