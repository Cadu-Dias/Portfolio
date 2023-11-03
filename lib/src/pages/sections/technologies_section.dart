import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/widgets/bar_technologies_widget.dart';
import 'package:portifolio/src/widgets/topic_widget.dart';
import 'package:reveal_on_scroll/reveal_on_scroll.dart';

class TechnologieSection extends StatefulWidget {
  final GlobalKey technologiesKey;

  const TechnologieSection({
    super.key,
    required this.technologiesKey,
  });

  @override
  State<TechnologieSection> createState() => _TechnologieSectionState();
}

class _TechnologieSectionState extends State<TechnologieSection> {
  late List _technologiesItems = [];
  late List _additionalTechnologiesItems = [];

  @override
  void initState() {
    readJSON();
    super.initState();
  }

  Future<void> readJSON() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _technologiesItems = data["technologies"];
      _additionalTechnologiesItems = data["additional_topics"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Technologies",
            key: widget.technologiesKey,
            style: const TextStyle(
                color: Pallete.white,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        Column(
          children: _technologiesItems
              .map((tecnologia) => BarWidget(
                  technologieName: tecnologia["tecnologia"],
                  proficiency: tecnologia["nível"],
                  barPercent: tecnologia["porcentagem"]))
              .toList(),
        ),
        const SizedBox(
          height: 70,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Additional Technologies and skills",
            style: TextStyle(
                color: Pallete.white,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 20,
          runSpacing: 20,
          children: _additionalTechnologiesItems.map((topic) => TopicWidget(title: topic["theme"])).toList()
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
