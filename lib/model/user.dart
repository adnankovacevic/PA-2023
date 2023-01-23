import 'dart:convert';

class User {
  final String fullname;
  final String email;
  final String password;

  User({
    required this.fullname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? fullname,
    String? email,
    String? password,
  }) {
    return User(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
