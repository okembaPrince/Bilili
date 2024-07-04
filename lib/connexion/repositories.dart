import'dart:convert';
import 'package:bilili/connexion/userModel.dart';
import 'package:http/http.dart' as http;





class UserRepository{
  String url='https://reqres.in/api/users?page=2';

 Future<List<UserModel>> getUsers() async{
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final List result= jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else{
      throw Exception(response.reasonPhrase);
    }

  }
}