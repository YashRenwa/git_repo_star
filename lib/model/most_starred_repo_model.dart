// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MostStarredRepo {
  String name;
  String description;
  int numberOfStars;
  String userName;
  String userAvatar;
  MostStarredRepo({
    required this.name,
    required this.description,
    required this.numberOfStars,
    required this.userName,
    required this.userAvatar,
  });

  MostStarredRepo copyWith({
    String? name,
    String? description,
    int? numberOfStars,
    String? userName,
    String? userAvatar,
  }) {
    return MostStarredRepo(
      name: name ?? this.name,
      description: description ?? this.description,
      numberOfStars: numberOfStars ?? this.numberOfStars,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'numberOfStars': numberOfStars,
      'userName': userName,
      'userAvatar': userAvatar,
    };
  }

  factory MostStarredRepo.fromMap(Map<String, dynamic> map) {
    return MostStarredRepo(
      name: map['name'] as String,
      description: map['description'] as String,
      numberOfStars: map['numberOfStars'] as int,
      userName: map['userName'] as String,
      userAvatar: map['userAvatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
