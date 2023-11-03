import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/utils/utils.dart';
import 'package:portifolio/src/widgets/timelinetile_widget.dart';

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {

  List _timeLinesPointList = [];
  Future<void> readJSON() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _timeLinesPointList = data["timeline_point"];
    });
  }

  @override
  void initState() {
    readJSON();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool needsToBeVertical = context.screenSize().width < 900 ? true : false;

    return Container(
        constraints:  BoxConstraints(
            minWidth: 100, maxWidth: 1400, minHeight: 200, maxHeight: needsToBeVertical? 780: 300),
        child: isVerticalVeryfication(needsToBeVertical));
  }

  Widget isVerticalVeryfication(
      bool needsToBeVertical) {
    if (needsToBeVertical) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 38, right: 100, left: 10),
            width: 10,
            height: 600,
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _timeLinesPointList
                  .map((timeLinePoint) => TimeLineTileWidget(
                      year: timeLinePoint["year"],
                      description: timeLinePoint["description"],
                      needsToBeVertical: needsToBeVertical))
                  .toList(),
            ),
          ),
        
        ],
      );
    }

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60, left: 100, right: 100),
          width: 1400,
          height: 5,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _timeLinesPointList
              .map((timeLinePoint) => TimeLineTileWidget(
                  year: timeLinePoint["year"],
                  description: timeLinePoint["description"],
                  needsToBeVertical: needsToBeVertical))
              .toList(),
        ),
      ],
    );
  }
}
