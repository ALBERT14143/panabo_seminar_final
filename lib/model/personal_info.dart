// To parse this JSON data, do
//
//     final personalInfo = personalInfoFromJson(jsonString);

import 'dart:convert';

class PersonalInfo {
    PersonalInfo({
        this.recNo,
        this.userId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.address,
        this.username,
        this.password,
        this.photoUrl,
    });

    int? recNo;
    String? userId;
    String? firstName;
    String? middleName;
    String? lastName;
    String? address;
    String? username;
    String? password;
    String? photoUrl;

    PersonalInfo copyWith({
        int? recNo,
        String? userId,
        String? firstName,
        String? middleName,
        String? lastName,
        String? address,
        String? username,
        String? password,
        String? photoUrl
    }) => 
        PersonalInfo(
            recNo: recNo ?? this.recNo,
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            middleName: middleName ?? this.middleName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            username: username ?? this.username,
            password: password ?? this.password,
            photoUrl: photoUrl ?? this.photoUrl,
        );

    factory PersonalInfo.fromRawJson(String str) => PersonalInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        recNo: json["recNo"] == null ? null : json["recNo"],
        userId: json["userId"] == null ? null : json["userId"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        address: json["address"] == null ? null : json["address"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "recNo": recNo == null ? null : recNo,
        "userId": userId == null ? null : userId,
        "firstName": firstName == null ? null : firstName,
        "middleName": middleName == null ? null : middleName,
        "lastName": lastName == null ? null : lastName,
        "address": address == null ? null : address,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "photoUrl": photoUrl == null ? null : photoUrl,
    };
}
