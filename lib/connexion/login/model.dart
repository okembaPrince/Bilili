
import 'dart:convert';

class LoginModel{
  final String mail;
  final String password;
  LoginModel(
      this.mail,
      this.password
      );
  LoginModel copyWith({
    String? mail,
    String? password
  }){
    return LoginModel(
        mail ?? this.mail,
        password ?? this.password);
  }

  Map<String, dynamic> toMap(){
    return {
      'mail': mail,
      'password': password
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map){
    return LoginModel(
      map['mail'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson()=> json.encode(toMap());
  factory LoginModel.fromJson(String source)=> LoginModel.fromMap(json.decode(source));

  @override
  String toString(){
    return 'RegisterModel(name: id: $mail, createdAt: $password)';
  }

  @override
  bool operator ==(Object other){
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.mail == mail &&
        other.password == password;
  }

  @override
  int get hashCode{
    return mail.hashCode ^ password.hashCode;
  }
}