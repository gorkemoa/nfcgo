import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String username;
  final String email;
  final String token;
  final String fullName;
  final String? profilePicture;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.fullName,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      fullName: json['fullName'] as String,
      profilePicture: json['profilePicture'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'fullName': fullName,
      'profilePicture': profilePicture,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, fullName: $fullName)';
  }
} 