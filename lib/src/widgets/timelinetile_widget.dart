import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';

class TimeLineTileWidget extends StatelessWidget {
  final String year;
  final String description;
  final bool needsToBeVertical;

  const TimeLineTileWidget(
      {super.key,
      required this.year,
      required this.description,
      required this.needsToBeVertical});

  @override
  Widget build(BuildContext context) {
    bool isScreenSmall = context.screenSize().width < 350? true : false;
    if (needsToBeVertical) {
      return Row(
        children: [
          Container(
            margin:  const EdgeInsets.only(bottom: 140, right: 10),
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Pallete.lightDarkBlue,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Pallete.lightPurple, Pallete.aquaBlue],
              ),
            ),
          ),
          Container(
            width: isScreenSmall? context.screenSize().width * 0.6 : context.screenSize().width * 0.8,
            height: 200,
            child: Text(
              "$year - $description",
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: isScreenSmall? 15: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Text(
          year,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Pallete.lightDarkBlue,
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Pallete.lightPurple, Pallete.aquaBlue],
            ),
          ),
        ),
        Container(
          width: 200,
          height: 200,
          child: Text(
            description,
            style: const TextStyle(
                color: Pallete.grey, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
