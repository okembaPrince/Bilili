import 'package:bilili/main.dart';
import 'package:bilili/screens/lancement/lancement.dart';
import 'package:bilili/screens/renitialisation/NewPassword.dart';
import 'package:bilili/screens/renitialisation/numero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


class RnCode extends StatefulWidget {
  const RnCode({super.key});

  @override
  State<RnCode> createState() => _RnCodeState();
}

class _RnCodeState extends State<RnCode> {

  String code= "";
  int correctCode=1234;
  late TextEditingController ctrlCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            // ignore: unnecessary_new
            return const RnNumero();
          }));

        },icon: const Icon(Icons.chevron_left,size: 30,),),

        title: const Text("Retour pour changer de numéro",style: TextStyle(fontSize: 17),),),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Réinitialisation",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text("Saisissez le code reçu",style: TextStyle(fontSize: 17),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) =>SizedBox(
                    height: 66,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value){

                        if (value.isNotEmpty && value.length<=4){
                          code += value;
                          FocusScope.of(context).nextFocus();
                          if (code.length >=4){

                            if(code == correctCode.toString()){
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.scale,
                                  dialogType: DialogType.success,
                                  title: "Information",
                                  body: const Center(
                                    child: Text('code correct !',
                                      style: TextStyle(fontStyle: FontStyle.italic,),),
                                  ),
                                  btnOkOnPress: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RnConfirmation()),
                                    );
                                  }
                              ).show();

                            } else {

                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                showCloseIcon: false,
                                content: AwesomeSnackbarContent(
                                  title: 'Vérification',
                                  message:
                                  'Le code entré est incorrect',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }

                          }
                        } else{
                          value="";
                          code="";
                        }
                      },
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: c_blanc),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      cursorColor: c_blanc,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),

                      ],

                      decoration: InputDecoration(

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: c_bleu, width: 1, style: BorderStyle.solid )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: c_bleu, width: 2, style: BorderStyle.solid)
                        ),

                        errorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: c_bleu,style: BorderStyle.solid,width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: c_bleu, width: 1, style: BorderStyle.solid )
                        ),
                        filled: true,
                        fillColor: c_bleu,


                      ),
                    )
                )),
              )
            ],
          )),
    );
  }
}
