// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'userData.g.dart';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class UserData {
  UserData({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  @HiveField(0)
  int? page;

  @HiveField(1)
  int? perPage;

  @HiveField(2)
  int? total;

  @HiveField(3)
  int? totalPages;

  @HiveField(4)
  List<Datum>? data;

  @HiveField(5)
  Support? support;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    page: json["page"] == null ? null : json["page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    total: json["total"] == null ? null : json["total"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "per_page": perPage == null ? null : perPage,
    "total": total == null ? null : total,
    "total_pages": totalPages == null ? null : totalPages,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support == null ? null : support!.toJson(),
  };
}

@HiveType(typeId: 3)
class Datum {
  Datum({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "avatar": avatar == null ? null : avatar,
  };
}

@HiveType(typeId: 4)
class Support {
  Support({
    this.url,
    this.text,
  });

  @HiveField(0)
  String? url;

  @HiveField(1)
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"] == null ? null : json["url"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "text": text == null ? null : text,
  };
}
