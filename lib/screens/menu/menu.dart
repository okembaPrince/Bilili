import 'package:bilili/main.dart';
import 'package:bilili/screens/menu/composants/acceuil.dart';
import 'package:bilili/screens/menu/composants/camera.dart';
import 'package:bilili/screens/menu/composants/profil/profil.dart';
import 'package:bilili/screens/menu/composants/sms.dart';
import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 int index=0;

 List<Widget> pageList= [
   const Acceuil(),
   const Camera(),
   const SMS(),
   const Profil()
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: c_noir,fontWeight: FontWeight.bold),
        selectedItemColor: c_noir,
        unselectedItemColor: c_gris,
        iconSize: 45,
        elevation: 0,

        onTap: (value){
          setState(() {
            index=value;

          });

        },
        currentIndex: index,
        items:const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/img/Home.png')),
          label: "Acceuil"),

          BottomNavigationBarItem(icon: ImageIcon(AssetImage("asset/img/Video Stabilization.png")),
          label: "Caméra"),

          BottomNavigationBarItem(icon: ImageIcon(AssetImage("asset/img/Messages.png")),
              label: "SMS"),

          BottomNavigationBarItem(icon: ImageIcon(AssetImage("asset/img/Accessibility Tools.png")),
              label: "Profil"),
        ],
      ),
      body: pageList[index],
    );
  }
}
