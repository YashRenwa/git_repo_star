import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:git_repo_star/constants.dart';
import 'package:git_repo_star/model/api_fetch_response_model.dart';
import 'package:git_repo_star/model/most_starred_repo_model.dart';
import 'package:intl/intl.dart';

class MostStarredRepoController {
  final _dio = Dio();

  Future<ResponseModel> getMostStarredRepos() async {
    String thirtyDaysAgoDate = _getDate30DaysAgo();
    String queryString = "?q=created:>$thirtyDaysAgoDate&sort=stars&order=desc";
    List<MostStarredRepo> mostStarredRepos = [];
    try {
      final response = await _dio.get(baseGitAPI + queryString);
      for (var item in json.decode(response.toString())['items']) {
        mostStarredRepos.add(
          MostStarredRepo(
            name: item['name'] ?? "NAN",
            description: item['description'] ?? "NAN",
            starGazers: item['stargazers_count'] ?? "NAN",
            userName: item['owner']['login'] ?? "NAN",
            avatarUrl: item['owner']['avatar_url'] ??
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=2970&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
        );
      }
      return ResponseModel(
          status: 200, error: "", mostStarredRepos: mostStarredRepos);
    } catch (e) {
      return ResponseModel(
          status: 400, error: e.toString(), mostStarredRepos: []);
    }
  }

  // With Pagination
  Future<ResponseModel> getMostStarredReposPagination(
      {required int pageNo, required int pageSize}) async {
    String thirtyDaysAgoDate = _getDate30DaysAgo();
    String queryString =
        "?q=created:>$thirtyDaysAgoDate&sort=stars&order=desc&per_page=$pageSize&page=$pageNo";
    List<MostStarredRepo> mostStarredRepos = [];
    try {
      final response = await _dio.get(baseGitAPI + queryString);
      for (var item in json.decode(response.toString())['items']) {
        mostStarredRepos.add(
          MostStarredRepo(
            name: item['name'] ?? "NAN",
            description: item['description'] ?? "NAN",
            starGazers: item['stargazers_count'] ?? "NAN",
            userName: item['owner']['login'] ?? "NAN",
            avatarUrl: item['owner']['avatar_url'] ??
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=2970&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
        );
      }
      return ResponseModel(
          status: 200, error: "", mostStarredRepos: mostStarredRepos);
    } catch (e) {
      return ResponseModel(
          status: 400, error: e.toString(), mostStarredRepos: []);
    }
  }

  String _getDate30DaysAgo() {
    DateTime today = DateTime.now();
    return DateFormat('yyyy-MM-dd')
        .format(today.subtract(const Duration(days: 30)));
  }
}
