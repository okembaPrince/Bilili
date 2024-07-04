import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'model.dart';


abstract class LoginRepository{
  Future<LoginModel> fetchDetails(String mail, String password);
}

class LoginRepo extends LoginRepository {


  @override
  Future<LoginModel> fetchDetails(String mail, String password) async {
    final response= await http.post(Uri.parse("https://blynk.cloud/external/api/isHardwareConnected?token=U66GvBwk8HOr5DQ1fFjXxoR1-Rf4Fcmu"),
        body: {
         "mail": mail, "password": password
        });

    if (response.statusCode == 201){

      return LoginModel.fromJson(response.body);

    } else{
      debugPrint("error in api call ${response.statusCode}");
      throw('failed to load api data');
    }
  }

}
