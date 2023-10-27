// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MostStarredRepo {
  String name;
  String description;
  int starGazers;
  String userName;
  String avatarUrl;
  MostStarredRepo({
    required this.name,
    required this.description,
    required this.starGazers,
    required this.userName,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'starGazers': starGazers,
      'userName': userName,
      'avatarUrl': avatarUrl,
    };
  }

  factory MostStarredRepo.fromMap(Map<String, dynamic> map) {
    return MostStarredRepo(
      name: map['name'] as String,
      description: map['description'] as String,
      starGazers: map['starGazers'] as int,
      userName: map['userName'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MostStarredRepo.fromJson(String source) =>
      MostStarredRepo.fromMap(json.decode(source) as Map<String, dynamic>);
}
