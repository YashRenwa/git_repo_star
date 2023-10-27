import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:git_repo_star/controller/most_starred_repo_controller.dart';
import 'package:git_repo_star/model/api_fetch_response_model.dart';
import 'package:git_repo_star/model/most_starred_repo_model.dart';
import 'package:git_repo_star/view/widgets/repo_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MostStarredRepoScreen extends StatefulWidget {
  const MostStarredRepoScreen({super.key});

  @override
  State<MostStarredRepoScreen> createState() => _MostStarredRepoScreenState();
}

class _MostStarredRepoScreenState extends State<MostStarredRepoScreen> {
  final MostStarredRepoController _controller = MostStarredRepoController();
  List<MostStarredRepo> mostStarredRepos = [];

  // Pagination Code
  static const _pageSize = 10;

  final PagingController<int, MostStarredRepo> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageNo) {
      _fetchPageResults(pageNo);
    });
    super.initState();
  }

  Future<void> _fetchPageResults(int pageNo) async {
    try {
      ResponseModel response = await _controller.getMostStarredReposPagination(
        pageNo: pageNo,
        pageSize: _pageSize,
      );
      if (response.status == 200) {
        final isLastPage = response.mostStarredRepos.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(response.mostStarredRepos);
        } else {
          final nextPageKey = pageNo + response.mostStarredRepos.length;
          _pagingController.appendPage(response.mostStarredRepos, nextPageKey);
        }
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "An Error Occurred: ${response.error}",
            ),
          ),
        );
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MOST STARRED REPOS 🌟",
          style: GoogleFonts.montserrat(
            fontSize: 0.035.sw,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: PagedListView<int, MostStarredRepo>(
          pagingController: _pagingController,
          shrinkWrap: true,
          builderDelegate: PagedChildBuilderDelegate<MostStarredRepo>(
            itemBuilder: (context, item, index) => RepoCard(
              mostStarredRepo: item,
            ),
            firstPageProgressIndicatorBuilder: (context) => SizedBox(
              height: 0.8.sh,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            newPageProgressIndicatorBuilder: (context) => Container(
              margin: EdgeInsets.symmetric(
                vertical: 0.03.sh,
              ),
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
            animateTransitions: true,
          ),
        ),
      ),
    );
  }
}
