// To parse this JSON data, do
//
//     final dtoCredentials = dtoCredentialsFromJson(jsonString);

import 'dart:convert';

class DtoCredentials {
    DtoCredentials({
        this.username,
        this.password,
    });

    String?username;
    String?password;

    DtoCredentials copyWith({
        String? username,
        String? password,
    }) => 
        DtoCredentials(
            username: username ?? this.username,
            password: password ?? this.password,
        );

    factory DtoCredentials.fromRawJson(String str) => DtoCredentials.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DtoCredentials.fromJson(Map<String, dynamic> json) => DtoCredentials(
        username: json["Username"] == null ? null : json["Username"],
        password: json["Password"] == null ? null : json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "Username": username == null ? null : username,
        "Password": password == null ? null : password,
    };
}
