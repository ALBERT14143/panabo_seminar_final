// To parse this JSON data, do
//
//     final dtoPersonalInfo = dtoPersonalInfoFromJson(jsonString);

import 'dart:convert';

class DtoPersonalInfo {
    DtoPersonalInfo({
        this.firstName,
        this.middleName,
        this.lastName,
        this.address,
        this.username,
        this.password,
    });

    String? firstName;
    String? middleName;
    String? lastName;
    String? address;
    String? username;
    String? password;

    DtoPersonalInfo copyWith({
        String? firstName,
        String? middleName,
        String? lastName,
        String? address,
        String? username,
        String? password,
    }) => 
        DtoPersonalInfo(
            firstName: firstName ?? this.firstName,
            middleName: middleName ?? this.middleName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            username: username ?? this.username,
            password: password ?? this.password,
        );

    factory DtoPersonalInfo.fromRawJson(String str) => DtoPersonalInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DtoPersonalInfo.fromJson(Map<String, dynamic> json) => DtoPersonalInfo(
        firstName: json["FirstName"] == null ? null : json["FirstName"],
        middleName: json["MiddleName"] == null ? null : json["MiddleName"],
        lastName: json["LastName"] == null ? null : json["LastName"],
        address: json["Address"] == null ? null : json["Address"],
        username: json["Username"] == null ? null : json["Username"],
        password: json["Password"] == null ? null : json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "FirstName": firstName == null ? null : firstName,
        "MiddleName": middleName == null ? null : middleName,
        "LastName": lastName == null ? null : lastName,
        "Address": address == null ? null : address,
        "Username": username == null ? null : username,
        "Password": password == null ? null : password,
    };
}
