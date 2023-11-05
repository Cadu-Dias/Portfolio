
import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/widgets/timeline_widget.dart';


class AboutMeSection extends StatefulWidget {
  final GlobalKey aboutMeKey;
  const AboutMeSection({super.key, required this.aboutMeKey});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  @override
  Widget build(BuildContext context) {
    bool isCellphone = context.screenSize().width < 700 ? true : false;
    return Column(
      children: [
        const SizedBox(height: 100,),
        Align(
          
          alignment: Alignment.topLeft,
          child: Text(
            "Sobre mim",
            key: widget.aboutMeKey,
            style: const TextStyle(
                color: Pallete.white,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          )
        ),
        SizedBox(height: isCellphone? 25: 50,),
        const TimeLineWidget(),
        const SizedBox(height: 20,)
      ],
    );
  }
}
