import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';

class TopicWidget extends StatelessWidget {
  final String title;

  const TopicWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: context.screenSize().width < 600? 50: 100, maxWidth: context.screenSize().width < 600? 200: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Pallete.lightPurple, Pallete.aquaBlue]),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                 BoxShadow(
                    color: Pallete.lightDarkBlue,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 2),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
