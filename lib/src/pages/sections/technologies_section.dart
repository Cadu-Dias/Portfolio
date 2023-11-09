import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/utils.dart';
import 'package:portifolio/src/widgets/bar_technologies_widget.dart';
import 'package:portifolio/src/widgets/topic_widget.dart';

class TechnologieSection extends StatefulWidget {
  final GlobalKey technologiesKey;
  final double containerWidth;
  const TechnologieSection({
    super.key,
    required this.technologiesKey, required this.containerWidth,
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
    final data = await Utility.geraJson();
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
            "Tecnologias",
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
                  barPercent: tecnologia["porcentagem"],
                  containerWidth: widget.containerWidth))
              .toList(),
        ),
        const SizedBox(
          height: 70,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Ferramentas adicionais e habilidades",
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
          spacing: 15,
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
