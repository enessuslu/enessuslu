import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.userId,
    required this.userName,
    required this.userPassword,
    required this.userFirstname,
    required this.userLastname,
    required this.userRole,
    required this.aktif,
    required this.userMail,
  });

  int userId;
  String userName;
  String userPassword;
  String userFirstname;
  String userLastname;
  String userRole;
  bool aktif;
  String userMail;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userId: json["USER_ID"],
    userName: json["USER_NAME"],
    userPassword: json["USER_PASSWORD"],
    userFirstname: json["USER_FIRSTNAME"],
    userLastname: json["USER_LASTNAME"],
    userRole: json["USER_ROLE"],
    aktif: json["ACTIVE"],
    userMail: json["USER_MAIL"],
  );

  Map<String, dynamic> toJson() => {
    "USER_ID": userId,
    "USER_NAME": userName,
    "USER_PASSWORD": userPassword,
    "USER_FIRSTNAME": userFirstname,
    "USER_LASTNAME": userLastname,
    "USER_ROLE": userRole,
    "ACTIVE": aktif,
    "USER_MAIL": userMail,
  };
}