import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.nim,
    required this.name,
    this.color = Colors.orange,
  });
  final String id;
  final String username;
  final String password;
  final String nim;
  final String name;
  final Color color;
}
