import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  final GlobalKey projectsKey;
  final GlobalKey technologiesKey;
  final GlobalKey aboutMeKey;
  const DrawerWidget(
      {super.key,
      required this.projectsKey,
      required this.technologiesKey,
      required this.aboutMeKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        primary: true,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Pallete.backgroundColor),
            accountName: Text("Nome: Cadu Dias Procópio Machado"),
            accountEmail: InkWell(onTap: Utility.openGmail, child: Text("E-mail: cadubas1@gmail.com")),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/foto_portifolio.png"),
            ),
          ),
          GestureDetector(
            onTap: () async {
              BuildContext context = projectsKey.currentContext!;
              await Scrollable.ensureVisible(context,
                  duration: const Duration(milliseconds: 1500));
            },
            child: ListTile(
              leading: Icon(
                Icons.work,
                color: Pallete.white,
              ),
              title: Text(
                "Projetos",
                style: TextStyle(color: Pallete.white),
              ),
              onTap: () async {
                // Ação ao clicar em "Projetos"
                Navigator.pop(context); // Fecha o Drawer
                BuildContext contextKey = projectsKey.currentContext!;
                await Scrollable.ensureVisible(contextKey,
                    duration: const Duration(milliseconds: 1500));
              },
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.code,
              color: Pallete.white,
            ),
            title: const Text(
              "Tecnologias",
              style: TextStyle(color: Pallete.white),
            ),
            onTap: () async {
              // Ação ao clicar em "Tecnologias"
              Navigator.pop(context); // Fecha o Drawer
              BuildContext contextKey = technologiesKey.currentContext!;
              await Scrollable.ensureVisible(contextKey,
                  duration: const Duration(milliseconds: 1500));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Pallete.white,
            ),
            title: const Text(
              "Sobre Mim",
              style: TextStyle(color: Pallete.white),
            ),
            onTap: () async {
              Navigator.pop(context);
              BuildContext contextKey = aboutMeKey.currentContext!;
              await Scrollable.ensureVisible(contextKey,
                  duration: const Duration(milliseconds: 1500));
            },
          ),
          ListTile(
            leading: const Icon(
              EvaIcons.linkedin,
              color: Pallete.white,
            ),
            title: const Text(
              "Linkedin",
              style: TextStyle(color: Pallete.white),
            ),
            onTap: () async {
             if (!await launchUrl(Uri.parse(
                  "https://www.linkedin.com/in/cadu-dias-45b596238/"))) {
                throw Exception(
                    'Could not launch https://www.linkedin.com/in/cadu-dias-45b596238/');
              }
            },
          ),
          ListTile(
            leading: const Icon(
              EvaIcons.github,
              color: Pallete.white,
            ),
            title: const Text(
              "Github",
              style: TextStyle(color: Pallete.white),
            ),
            onTap: () async {
              if (!await launchUrl(Uri.parse("https://github.com/Cadu-Dias"))) {
                throw Exception(
                    'Could not launch https://github.com/Cadu-Dias');
              }
            },
          ),
          ListTile(
            leading: const Icon(
              EvaIcons.twitter,
              color: Pallete.white,
            ),
            title: const Text(
              "Twitter",
              style: TextStyle(color: Pallete.white),
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
  
}
