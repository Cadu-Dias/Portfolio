import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/widgets/project_widget.dart';
import 'package:reveal_on_scroll/reveal_on_scroll.dart';

class ProjectSection extends StatefulWidget {
  final GlobalKey projectsKey;
  
  const ProjectSection(
      {super.key, required this.projectsKey});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  int currentIndex = 0;
  late List _projectItems = [];

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
      _projectItems = data["projects"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Projects",
            key: widget.projectsKey,
            style: const TextStyle(
                color: Pallete.white,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        styleProjects(),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }

  Widget styleProjects() {
    if (context.screenSize().width < 950) {
      return Column(
        children: [
          CarouselSlider(
              items: _projectItems
                  .map((projeto) => ProjectWidget(
                      projectTitle: projeto["titulo"],
                      projectDescription: projeto["descricao"],
                      projectImageURL: projeto["image_url"],
                      projectGithub: projeto["github"]))
                  .toList(),
              options: CarouselOptions(
                height: 540,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                animateToClosest: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _projectItems.length; i++)
                Container(
                  height: 13,
                  width: 13,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      gradient: currentIndex == i
                          ? const LinearGradient(
                              colors: [Pallete.lightPurple, Pallete.aquaBlue])
                          : const LinearGradient(
                              colors: [Pallete.white, Pallete.white]),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.aquaBlue,
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(2, 2))
                      ]),
                )
            ],
          )
        ],
      );
    }

    return Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: _projectItems
            .map((projeto) => ProjectWidget(
                projectTitle: projeto["titulo"],
                projectDescription: projeto["descricao"],
                projectImageURL: projeto["image_url"],
                projectGithub: projeto["github"]))
            .toList());
  }
}
