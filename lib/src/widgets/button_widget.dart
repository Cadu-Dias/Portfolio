import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  Function()? buttonFunction;

  ButtonWidget({super.key, required this.textButton, this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 50, maxWidth: 500, minHeight: 50, maxHeight: 500),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Pallete.lightPurple,
          Pallete.aquaBlue,
        ]),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Pallete.lightDarkBlue,
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 8),
        child: TextButton(
          
          onPressed: buttonFunction,
          child: Text(
            textButton,
            style: const TextStyle(
              color: Pallete.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
