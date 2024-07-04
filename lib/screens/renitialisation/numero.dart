import 'package:bilili/main.dart';
import 'package:bilili/screens/lancement/presentation.dart';
import 'package:bilili/screens/renitialisation/RnCode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RnNumero extends StatefulWidget {
  const RnNumero({super.key});

  @override
  State<RnNumero> createState() => _RnNumeroState();
}


class _RnNumeroState extends State<RnNumero> {


  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    TextEditingController().dispose();
    super.dispose();
  }

  TextEditingController ctrNumero= TextEditingController();


  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
        },),
        title: const Text("Retour vers  la page de connexion",style: TextStyle(fontSize: 17),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              const Text("Réinitialisation",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text("Entrez votre numéro",style: TextStyle(fontSize: 17),),
              const SizedBox(height: 25,),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Téléphone",style: TextStyle(fontSize: 17),),
                      const SizedBox(height: 8,),
                      TextFormField(
                        style: const TextStyle(height: 1),
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
                          hintStyle: const TextStyle(color: c_gris,),
                          fillColor: Colors.grey[300],
                          filled: !_isFocused,
                        ),

                      ),

                    ],
                  )),

              const SizedBox(height: 360,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      // ignore: unnecessary_new
                      return const RnCode();
                    }));

                  }

                },


                child: const Text(
                  'Suivant', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
