// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:git_repo_star/model/most_starred_repo_model.dart';

class ResponseModel {
  int status;
  String error;
  List<MostStarredRepo> mostStarredRepos;
  ResponseModel({
    required this.status,
    required this.error,
    required this.mostStarredRepos,
  });
}
