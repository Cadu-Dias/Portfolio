import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/widgets/button_widget.dart';
import 'package:portifolio/src/widgets/gradient_text.dart';
import 'package:portifolio/src/widgets/profile_animation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class PresentationSection extends StatefulWidget {
  const PresentationSection({super.key});

  @override
  State<PresentationSection> createState() => _PresentationSectionState();
}

class _PresentationSectionState extends State<PresentationSection> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = kIsWeb || context.screenSize().width < 1000? context.screenSize().width * 0.9 : context.screenSize().width * 0.75;

    return Column(
      children: [
        SizedBox(
          height: context.screenSize().width < 1780 ? 100 : 200,
        ),
        SizedBox(
          width: containerWidth,
          child: Wrap(
            runAlignment: WrapAlignment.end,
            runSpacing: 60,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: kIsWeb? 650 : 840),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(
                      "Hello, I'm Cadu,",
                      gradient: LinearGradient(
                          colors: [Pallete.lightPurple, Pallete.aquaBlue]),
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "a FullStack Developer",
                          textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TyperAnimatedText(
                          "a CiberSecurity",
                          textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TyperAnimatedText(
                          "a DevOps worker",
                          textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Sou estudante do Instituto Mauá de Tecnologia e estou à procura de uma oportunidade de emprego que me permita aprender como é viver no ambiente de trabalho. Meu objetivo é aprimorar minhas habilidades e contribuir para o sucesso da equipe e da empresa onde trabalharei. Acredito que essa experiência enriquecerá meu crescimento profissional e pessoal, permitindo-me contribuir para os objetivos da organização.",
                      style: TextStyle(fontSize: 20, color: Pallete.grey),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(
                      textButton: "Download CV",
                      buttonFunction: () {
                        print("");
                      },
                    ),
                  ],
                ),
              ),
              ProfileAnimation(containerWidth: containerWidth)
            ],
          ),
        ),
      ],
    );
  }
}
