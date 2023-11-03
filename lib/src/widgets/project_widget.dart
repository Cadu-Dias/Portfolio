import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatefulWidget {
  final String projectTitle;
  final String projectDescription;
  final String projectImageURL;
  final String projectGithub;
  const ProjectWidget(
      {super.key,
      required this.projectTitle,
      required this.projectDescription,
      required this.projectImageURL,
      required this.projectGithub});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(widget.projectGithub);

    return Container(
      margin: context.screenSize().width < 600? const EdgeInsets.only(left: 20, right: 20) : null,
      constraints:  BoxConstraints(
          maxWidth: 425, minWidth: 200, minHeight: 200, maxHeight: context.screenSize().width < 600? 700: 550),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(148, 130, 235, 1),
            Color.fromRGBO(70, 180, 226, 1),
            
          ]), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 2, left: 3, right: 3),
            constraints: const BoxConstraints(
                minWidth: 50, maxWidth: 510, minHeight: 50, maxHeight: 200),
            child: Image.asset(
              widget.projectImageURL,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.projectTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.projectDescription,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 1,
            runSpacing: 5,
            children: [
              ButtonWidget(
                textButton: "  Live Preview  ",
                buttonFunction: () {
                  print("a");
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 400 ? 5 : 10,
              ),
              Container(
                constraints: const BoxConstraints(
                    minWidth: 50, maxWidth: 500, minHeight: 50, maxHeight: 500),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: const Color.fromRGBO(15, 22, 36, 1)),
                child: TextButton(
                    onPressed: () async {
                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    
                    child: const Text(
                      "Check on Github",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
