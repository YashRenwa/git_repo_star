import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:git_repo_star/model/most_starred_repo_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class RepoCard extends StatefulWidget {
  const RepoCard({super.key, required this.mostStarredRepo});
  final MostStarredRepo mostStarredRepo;
  @override
  State<RepoCard> createState() => _RepoCardState();
}

class _RepoCardState extends State<RepoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 0.02.sh),
      padding: EdgeInsets.symmetric(
        horizontal: 0.035.sw,
        vertical: 0.015.sh,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffe4e4e4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0.03.sw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 0.035.sw,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      widget.mostStarredRepo.avatarUrl,
                    ),
                  ),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  Text(
                    widget.mostStarredRepo.userName,
                    style: GoogleFonts.poppins(
                      fontSize: 0.03.sw,
                      color: Color(0xff313131),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "🌟 ${widget.mostStarredRepo.starGazers} stars",
                    style: GoogleFonts.poppins(
                      fontSize: 0.03.sw,
                      color: Color(0xff313131),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 0.015.sh,
          ),
          Text(
            widget.mostStarredRepo.name,
            style: GoogleFonts.montserrat(
              fontSize: 0.04.sw,
              color: Color(0xff313131),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
          ReadMoreText(
            widget.mostStarredRepo.description,
            trimLines: 3,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
            style: GoogleFonts.poppins(
              fontSize: 0.03.sw,
            ),
          ),
        ],
      ),
    );
  }
}
