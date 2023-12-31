import 'dart:typed_data';
import 'dart:html' as html;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:portifolio/src/widgets/button_widget.dart';
import 'package:portifolio/src/widgets/profile_animation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:universal_html/html.dart';
class PresentationSection extends StatefulWidget {
  const PresentationSection({super.key});

  @override
  State<PresentationSection> createState() => _PresentationSectionState();
}

class _PresentationSectionState extends State<PresentationSection> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = kIsWeb || context.screenSize().width < 1000? context.screenSize().width * 0.9 : context.screenSize().width * 0.75;
    bool needHeight = context.screenSize().width < 650? true: false;
    bool isCellphone =  context.screenSize().width < 500? true: false;
    bool isSmaller = context.screenSize().width < 335? true: false;
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
                    GradientText(
                      'Olá, eu sou Cadu,',
                      style: const TextStyle(
                        fontSize:50.0, fontWeight: FontWeight.bold
                      ),
                      colors: const [
                      Pallete.lightPurple,
                      Pallete.aquaBlue,
                     ],
                    ),
                    Container(
                      height: needHeight? isCellphone? isSmaller? 280: 225: 150 : null,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "um Desenvolvedor FullStack",
                            textStyle: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TyperAnimatedText(
                            "um Analista de Segurança",
                            textStyle: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TyperAnimatedText(
                            "um Trabalhador DevOps",
                            textStyle: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                        
                      ),
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
                      textButton: "Baixar CV",
                      buttonFunction: () async {
                        final ByteData data = await rootBundle.load('assets/pdfs/cv_template.pdf');
                        final Uint8List bytes = data.buffer.asUint8List();
                        final Blob pdfBlob = html.Blob([bytes]);
                        final String url = html.Url.createObjectUrlFromBlob(pdfBlob);
                        final AnchorElement anchor = AnchorElement(href: url)
                           ..target = 'webpdf'
                           ..download = 'curriculo_cadu_dias.pdf'
                            ..click();

                        html.Url.revokeObjectUrl(url);
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