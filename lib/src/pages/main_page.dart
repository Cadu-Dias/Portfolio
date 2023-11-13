import 'package:portifolio/pallete.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/src/pages/sections/aboutme_section.dart';
import 'package:portifolio/src/pages/sections/footer_section.dart';
import 'package:portifolio/src/pages/sections/presentation_section.dart';
import 'package:portifolio/src/pages/sections/projects_section.dart';
import 'package:portifolio/src/pages/sections/technologies_section.dart';
import 'package:portifolio/src/widgets/drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:reveal_on_scroll/reveal_on_scroll.dart';

class MainSinglePage extends StatefulWidget {
  const MainSinglePage({Key? key}) : super(key: key);

  @override
  MainSinglePageState createState() => MainSinglePageState();
}

class MainSinglePageState extends State<MainSinglePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ScrollController scrollController = ScrollController();
  ScrollController projectsController = ScrollController();
  ScrollController technologiesController = ScrollController();
  ScrollController certificationController = ScrollController();

  GlobalKey projectsKey = GlobalKey();
  GlobalKey technologiesKey = GlobalKey();
  GlobalKey aboutMeKey = GlobalKey();
  bool isProjectoHover = false;
  bool isTechnologiesHover = false;
  bool isAboutMeHover = false;
  bool showButton = false;
  
  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          1.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showButton = true;
        setState(() {
          //update state
        });
      } else {
        showButton = false;
        setState(() {
          //update state
        });
      }
    });
    projectsController = ScrollController();
    technologiesController = ScrollController();
    certificationController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Verifica a largura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen =
        screenWidth <= 700; // Defina o valor de largura desejado
    double containerWidth = MediaQuery.of(context).size.width < 1200
        ? MediaQuery.of(context).size.width * 0.95
        : MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Pallete.backgroundColor,
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 200), //show/hide animation
        opacity: showButton ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Pallete.lightPurple, Pallete.aquaBlue
            ]),
            boxShadow: [
              BoxShadow(
                 color: Pallete.lightDarkBlue,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 2
              )
            ]
          ),
          child: FloatingActionButton(
            onPressed: () async {
              scrollController.animateTo(0,
                  duration:
                      const Duration(milliseconds: 500), //duration of scroll
                  curve: Curves.fastOutSlowIn //scroll type
                  );
            },
        
            backgroundColor: Pallete.transparent,
            shape: CircleBorder(),
            child: const Icon(
              Icons.arrow_upward,
              size: 30,
              color: Pallete.white,
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(
        projectsKey: projectsKey,
        technologiesKey: technologiesKey,
        aboutMeKey: aboutMeKey,
      ),
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: SizedBox(
              width: containerWidth,
              child: removeAnimation(isWideScreen, containerWidth)
            ),
          ),
        ),
      ),
    );
  }

  Widget inserirDrawer(
      bool isWideScreen, GlobalKey<ScaffoldState> scaffoldkey) {
    if (isWideScreen) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
          "C.M. Portfólio",
          style: TextStyle(
            fontSize: 25,
            color: Pallete.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.menu,
              color: Pallete.white), // Ícone do menu hamburguer
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            // Abre o Drawer
          },
        ),
      ]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "C.M. Portfólio",
        style: TextStyle(
          fontSize: 25,
          color: Pallete.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          InkWell(
            onHover: (val) {
              setState(() {
                isProjectoHover = val;
              });
            },
            onTap: () async {
              BuildContext context = projectsKey.currentContext!;
              await Scrollable.ensureVisible(context,
                  duration: const Duration(milliseconds: 1500));
            },
            child: Container(
              decoration: BoxDecoration(
                border: isProjectoHover? const Border(
                  bottom: BorderSide(color: Pallete.lightPurple, width: 2),
                ) : null,
              ),
              child: Text(
                "Projetos",
                style: TextStyle(color: Pallete.white, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 80),
          InkWell(
            onHover: (val) {
              setState(() {
                isTechnologiesHover = val;
              });
            },
            onTap: () async {
              BuildContext context = technologiesKey.currentContext!;
              await Scrollable.ensureVisible(context,
                  duration: const Duration(milliseconds: 1500));
            },
            child: Container(
              decoration: BoxDecoration(
                border: isTechnologiesHover? const Border(
                  bottom: BorderSide(color: Pallete.lightPurple, width: 2),
                ) : null,
              ),
              child: const Text(
                "Tecnologias",
                style: TextStyle(color: Pallete.white, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 80),
          InkWell(
            onHover: (val) {
              setState(() {
                isAboutMeHover = val;
              });
            },
            onTap: () async {
              BuildContext context = aboutMeKey.currentContext!;
              await Scrollable.ensureVisible(context,
                  duration: const Duration(milliseconds: 1500));
            },
            child: Container(
              decoration: BoxDecoration(
                border: isAboutMeHover? const Border(
                  bottom: BorderSide(color: Pallete.lightPurple, width: 2),
                ) : null,
              ),
              child: const Text(
                "Sobre Mim",
                style: TextStyle(color: Pallete.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
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
              if (!await launchUrl(Uri.parse("https://github.com/Cadu-Dias"))) {
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
    ]);
  }

  Widget removeAnimation(bool isWideScreen, double containerWidth) {
    if(isWideScreen) {
      return Column(
        children: [
           Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: inserirDrawer(isWideScreen, scaffoldKey)),
            const PresentationSection(),
            ProjectSection(projectsKey: projectsKey),
            TechnologieSection(technologiesKey: technologiesKey, containerWidth: containerWidth),
            AboutMeSection(aboutMeKey: aboutMeKey),
            const FooterSection()
              
        ],
      );
    }

    return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: inserirDrawer(isWideScreen, scaffoldKey)),
                  const PresentationSection(),
                  ScrollToReveal.withAnimation(
                      label: "Projects Section",
                      reflectPosition: -100,
                      scrollController: scrollController,
                      animationType: AnimationType.findInRight,
                      child: ProjectSection(projectsKey: projectsKey)),
                  ScrollToReveal.withAnimation(
                    label: "Technologies Section",
                    reflectPosition: -150,
                    scrollController: scrollController,
                    animationType: AnimationType.findInRight,
                    child: TechnologieSection(
                      technologiesKey: technologiesKey,
                      containerWidth: containerWidth,
                    ),
                  ),
                  ScrollToReveal.withAnimation(
                    label: "AboutMe Section",
                    reflectPosition: -80,
                    scrollController: scrollController,
                    animationType: AnimationType.findInRight,
                    child: AboutMeSection(
                      aboutMeKey: aboutMeKey,
                    ),
                  ),
                  const FooterSection(),
                  const SizedBox(height: 20,)
                ],
              );
  }
}
