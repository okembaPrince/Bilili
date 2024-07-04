import 'package:bilili/main.dart';
import 'package:bilili/screens/menu/menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}


class _ConfigurationState extends State<Configuration> {

  DateTime? date;
  final DateFormat dateFormat = DateFormat('yyyy/MM/dd');


  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  final _focusPassword = FocusNode();
  bool focusPassword=false;

  final _focusConfirmPassword = FocusNode();
  bool focusConfirmPassword=false;


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

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
    _focusNode.dispose();
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();
    TextEditingController().dispose();
    super.dispose();
  }


  bool password=true;

//recuperation des valeurs des champs
  TextEditingController ctrlNom= TextEditingController();
  TextEditingController ctrlSurnom= TextEditingController();
  TextEditingController ctrVille= TextEditingController();
  final _formKey= GlobalKey<FormState>();

  final List<String> listGenre = [
    'Masculin',
    'Feminin',
  ];
  String? selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.only(left: 16,right: 16),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(height: 95,),
              const Text("Informations personnelles",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 7,),
              const Text("Configurer votre compte",style: TextStyle(fontSize: 17,),),

               const SizedBox(height: 20,),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nom & Prénom",style: TextStyle(fontSize: 17),),
                      const SizedBox(height: 3,),
                     TextFormField(
                        style: const TextStyle(height: 0),
                        focusNode: _focusNode,
                        controller: ctrlNom,
                        cursorErrorColor: c_rouge,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Entrez votre Nom & Prénom";

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

                          fillColor: Colors.grey[300],
                          filled: !_isFocused,
                        ),

                      ),

                      const SizedBox(height: 15,),
                      const Text("Surnom",style: TextStyle(fontSize: 17),),
                      const SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 1),
                        focusNode: _focusPassword,
                        controller: ctrlSurnom,
                        cursorColor: c_gris,
                        validator: (value){
                          if (value!.isEmpty){
                            return "Entrez votre surnom";

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

                            hintStyle: const TextStyle(color: c_gris),
                            fillColor: Colors.grey[300],
                            filled: !focusPassword,

                        ),

                      ),

                      const SizedBox(height: 15,),
                      const Text("Ville",style: TextStyle(fontSize: 17),),
                      const SizedBox(height: 3,),
                      TextFormField(
                        style: const TextStyle(height: 0),
                        focusNode: _focusConfirmPassword,
                        controller: ctrVille,
                        cursorErrorColor: c_rouge,
                        cursorColor: c_gris,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Entrez le nom de la ville";
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

                          hintStyle: const TextStyle(color: c_gris),
                          fillColor: Colors.grey[300],
                          filled: !focusConfirmPassword,
                        ),

                      ),

                      const SizedBox(height: 15,),
                      const Row(children: [
                        SizedBox(width: 20,),
                        Text("Né(e) le",style: TextStyle(fontSize: 17),),
                        SizedBox(width: 104,),
                        Text("Sexe",style: TextStyle(fontSize: 17),),
                      ],),

                      ListTile(
                        leading: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(148, 48),
                            backgroundColor: c_gris[300],
                            textStyle: const TextStyle(fontSize: 25),


                            side: const BorderSide(style: BorderStyle.none),

                            shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () async {
                            afficherDate();
                          },

                          child: Row(
                            children: [
                              Text(date==null? '                     ': dateFormat.format(date!),style: const TextStyle(fontSize: 13,color: c_noir),),

                              const Icon(Icons.arrow_drop_down_outlined,color: c_noir,size: 30,)
                            ],
                          ),

                        ),
                        trailing: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            items: listGenre
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            value: selectedGenre,
                            onChanged: (String? value) {
                              setState(() {
                                selectedGenre = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 130,

                                padding: const EdgeInsets.symmetric(horizontal: 16),


                                decoration: BoxDecoration(
                                  color: c_gris[300],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      color: c_gris,
                                      width: 2,
                                      style: BorderStyle.none
                                  ),
                                )
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 35,
                              iconEnabledColor: c_noir,
                              iconDisabledColor: c_noir,
                            ),

                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: c_gris[100]

                              ),

                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility: MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,

                            ),
                          ),
                        ),
                      ),

                    ],
                  )),

              const SizedBox(height: 85,),
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
                        if (selectedGenre!.isEmpty){
                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 1,
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: false,
                            content: AwesomeSnackbarContent(
                              title: 'Attention',
                              message: 'Veuillez sélectionner le genre (Masculin ou feminin)',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.failure,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else if(date==null){
                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 1,
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: false,
                            content: AwesomeSnackbarContent(
                              title: 'Attention',
                              message: 'Veuillez sélectionner votre date de naissance',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.failure,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else{
                          AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              title: "Information",
                              body: const Center(
                                child: Text('Votre compte est prêt !',
                                  style: TextStyle(fontStyle: FontStyle.italic,),),
                              ),
                              btnOkOnPress: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Menu()),
                                );
                              }
                          ).show();

                        }
                      }

                    },


                    child: const Text(
                      'Suivant', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
                  ),

                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Avez-vous un compte ? ",
                        style: TextStyle(fontSize: 13, color: c_noir),),
                      // ignore: deprecated_member_use
                      TextButton(onPressed: () {
                        // Naviguer à la page login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Menu()),
                        );

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

  void afficherDate() async{
    DateTime? choix= await showDatePicker(
      context: context,
      initialDate:  DateTime(2000),
      firstDate: DateTime(1970),
      lastDate:DateTime(2030));

    if (choix !=null){
      setState(() {
        date=choix;
      });
    }
  }
}
