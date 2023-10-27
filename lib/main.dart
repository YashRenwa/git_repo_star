import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:git_repo_star/constants.dart';
import 'package:git_repo_star/view/most_starred_repo_screen.dart';
import 'package:git_repo_star/view/most_starred_repo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: appThemeColor,
            ),
          ),
          home: const MostStarredRepoScreen(),
        );
      },
    );
  }
}
