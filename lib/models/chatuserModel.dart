// To parse this JSON data, do
//
//     final chatUser = chatUserFromMap(jsonString);

import 'dart:convert';

ChatUser chatUserFromMap(String str) => ChatUser.fromMap(json.decode(str));

String chatUserToMap(ChatUser data) => json.encode(data.toMap());

class ChatUser {
  bool isActive;
  String lastSeen;
  String phone;
  String profile;
  String about;
  String name;
  String id;
  String createAt;

  ChatUser({
    required this.isActive,
    required this.lastSeen,
    required this.phone,
    required this.profile,
    required this.about,
    required this.name,
    required this.id,
    required this.createAt,
  });

  factory ChatUser.fromMap(Map<String, dynamic> json) => ChatUser(
        isActive: json["is_active"],
        lastSeen: json["last_seen"],
        phone: json["phone"],
        profile: json["profile"],
        about: json["about"],
        name: json["name"],
        id: json["id"],
        createAt: json["create_at"],
      );

  Map<String, dynamic> toMap() => {
        "is_active": isActive,
        "last_seen": lastSeen,
        "phone": phone,
        "profile": profile,
        "about": about,
        "name": name,
        "id": id,
        "create_at": createAt,
      };
}
