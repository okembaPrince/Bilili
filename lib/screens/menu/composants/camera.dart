import 'dart:io';

import 'package:bilili/main.dart';
import 'package:bilili/screens/menu/composants/sms.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

   File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

   final List<String> listCompany = [
     'Eneo',
     'Camwater',
     'IsaCam'
   ];
   String? selectedCompany;

   TextEditingController ctrlText=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
        },),
        title: const Text("Capturez les images",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16), child: Column(
            children: [
            SizedBox(
              height: 200,
              child: IconButton(onPressed:() async{
                getImage();
        
              }, icon: _image==null ? Image.asset("asset/img/camera_image.jpg",):
              Image.file(_image!)),
            ),

            SizedBox(height: 25,),
            DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                "Choisir l'entreprise destinataire",
                style: TextStyle(
                  fontSize: 14,
                    fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  overflow: TextOverflow.ellipsis
                ),
              ),
              items: listCompany
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
              value: selectedCompany,
              onChanged: (String? value) {
                setState(() {
                  selectedCompany = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
        
        
                decoration: BoxDecoration(
                  color: c_gris[100],
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: c_gris,
                      width: 2,
                    style: BorderStyle.solid
                  ),
                )
              ),
              iconStyleData: const IconStyleData(
                icon: ImageIcon(AssetImage("asset/img/select.png")),
                iconSize: 14,
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

              SizedBox(height: 25,),
            TextFormField(
              maxLines: 10,
              minLines: 5,
        
              controller: ctrlText,
              cursorColor: c_gris,
              validator: (value){
                if (value!.isEmpty){
                  return "Quel est le constat ou problème rencontré ?";
        
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
        
        
        
                  hintStyle: TextStyle(color: c_gris[100]),
                  fillColor: Colors.grey[300],
                  filled: true,
        
        
                  suffixIcon: IconButton(
        
                      onPressed: () {
                    setState(() {
        
                    });
        
                  }, icon:  const ImageIcon(AssetImage("asset/img/voice.png"),color: c_bleu,), iconSize: 30.0,padding: const EdgeInsets.only(top: 120),)
              ),
        
        
            ),

              SizedBox(height: 100,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 48),
                backgroundColor: c_bleu,
                textStyle: const TextStyle(fontSize: 25),
        
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () async {
        
                if(ctrlText.text.length > 3 ){
                  if(selectedCompany!.isNotEmpty){
                    if(_image!=null){
                      AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.success,
                          title: "Information",
                          body: const Center(
                            child: Text('Les informations ont été envoyés avec succès !',
                              style: TextStyle(fontStyle: FontStyle.italic,),),
                          ),
                          btnOkOnPress: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              // ignore: unnecessary_new
                              return const SMS();
                            }));
                          }
                      ).show();
                    }
                  } else{
                    final snackBar = SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 1,
                      behavior: SnackBarBehavior.floating,
                      showCloseIcon: false,
                      content: AwesomeSnackbarContent(inMaterialBanner: false,
                        title: 'Information',
                        message:"sélectionnez l'entreprise destinataire",
        
                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
        
                  }
        
                } else{
                  final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 1,
                    behavior: SnackBarBehavior.floating,
                    showCloseIcon: false,
                    content: AwesomeSnackbarContent(
                      title: 'Information',inMaterialBanner: false,
                      message:"Faites un résumé du problème",
        
        
                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
        
              },
        
        
              child: const Text(
                'Envoyer', textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ],
        ),),
      ),
    );
  }
}
