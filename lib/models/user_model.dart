import 'dart:convert';

class UserModel {
  String id;
  String name;
  String username;

  UserModel({
    this.id,
    this.name,
    this.username,
  });

  UserModel copyWith({
    String id,
    String name,
    String username,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(id: $id, name: $name, username: $username)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.name == name &&
      other.username == username;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ username.hashCode;
}
