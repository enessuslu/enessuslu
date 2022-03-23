import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.resource,
  });

  List<Resource> resource;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    resource: List<Resource>.from(json["resource"].map((x) => Resource.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resource": List<dynamic>.from(resource.map((x) => x.toJson())),
  };
}

class Resource {
  Resource({
    required this.name,
    required this.password,
  });

  String name;
  String password;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    name: json["Name"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Password": password,
  };
}