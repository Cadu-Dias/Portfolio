import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/utils/utils.dart';
import 'package:portifolio/src/widgets/gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';


class FooterSection extends StatefulWidget {
  const FooterSection ({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection > {

  bool isEmailHover = false;

  @override
  Widget build(BuildContext context) {
    bool needsToBeColumn = context.screenSize().width < 800 ? true : false;

    if (needsToBeColumn) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GradientText(
            "Sinta-se a vontade para me contatar",
            gradient:
                LinearGradient(colors: [Pallete.lightPurple, Pallete.aquaBlue]),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onHover: (val) {
              setState(() {
                isEmailHover = val;
              });
            },
            onTap: Utility.openGmail,
            child: Container(
              decoration:BoxDecoration(
                border: isEmailHover? const Border(
                  bottom: BorderSide(color: Pallete.lightPurple, width: 2),
                ) : null,
              ), 
              child: const Text("cadubas1@gmail.com",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallete.white)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      "https://www.linkedin.com/in/cadu-dias-45b596238/"))) {
                    throw Exception(
                        'Could not launch https://www.linkedin.com/in/cadu-dias-45b596238/');
                  }
                },
                child: Icon(
                  EvaIcons.linkedin,
                  color: Pallete.white,
                ),
              ),
              SizedBox(width: 12),
              Icon(
                EvaIcons.twitter,
                color: Pallete.white,
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(
                      Uri.parse("https://github.com/Cadu-Dias"))) {
                    throw Exception(
                        'Could not launch https://github.com/Cadu-Dias');
                  }
                },
                child: Icon(
                  EvaIcons.github,
                  color: Pallete.white,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const GradientText(
          "Sinta-se a vontade para me contatar",
          gradient:
              LinearGradient(colors: [Pallete.lightPurple, Pallete.aquaBlue]),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
         InkWell(
            onHover: (val) {
              setState(() {
                isEmailHover = val;
              });
            },
            onTap: Utility.openGmail,
            child: Container(
              decoration:BoxDecoration(
                border: isEmailHover? const Border(
                  bottom: BorderSide(color: Pallete.lightPurple, width: 2),
                ) : null,
              ), 
              child: const Text("cadubas1@gmail.com",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallete.white)),
            ),
          ),
        const Text("Telegram @Cadu-Dias",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Pallete.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                if (!await launchUrl(Uri.parse(
                    "https://www.linkedin.com/in/cadu-dias-45b596238/"))) {
                  throw Exception(
                      'Could not launch https://www.linkedin.com/in/cadu-dias-45b596238/');
                }
              },
              child: Icon(
                EvaIcons.linkedin,
                color: Pallete.white,
              ),
            ),
            SizedBox(width: 12),
            Icon(
              EvaIcons.twitter,
              color: Pallete.white,
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () async {
                if (!await launchUrl(
                    Uri.parse("https://github.com/Cadu-Dias"))) {
                  throw Exception(
                      'Could not launch https://github.com/Cadu-Dias');
                }
              },
              child: Icon(
                EvaIcons.github,
                color: Pallete.white,
              ),
            ),
          ],

        ),
      ],
    );
  }
}