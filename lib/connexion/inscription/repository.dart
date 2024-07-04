import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'model.dart';


abstract class InscriptionRepository{
  Future<InscriptionModel> fetchDetails(String nom, String prenom, String mail, String password);
}

class InscriptionRepo extends InscriptionRepository {


  @override
  Future<InscriptionModel> fetchDetails(String nom, String prenom, String mail, String password) async {
    final response= await http.post(Uri.parse("https://reqres.in/api/users"),
        body: {
          "nom": nom, "prenom": prenom, "mail": mail, "password": password
        });

    if (response.statusCode == 201){

      return InscriptionModel.fromJson(response.body);
    } else{
      debugPrint("error in api call ${response.statusCode}");
      throw('failed to load api data');
    }
  }

}
