import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:portifolio/pallete.dart';

class BarWidget extends StatefulWidget {
  final String technologieName;
  final String proficiency;
  final String barPercent;
  const BarWidget({super.key, required this.technologieName, required this.proficiency, required this.barPercent});

  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.technologieName,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Pallete.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.proficiency,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Pallete.white),
                )
              ],
            ),
          ),
        
          const SizedBox(height: 10,),
          LinearPercentIndicator(
            addAutomaticKeepAlive: false,
            clipLinearGradient: true,
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 2500,

            lineHeight: 20.0,
            percent: double.parse(widget.barPercent),
            barRadius: const Radius.circular(20),
            maskFilter:  const MaskFilter.blur(BlurStyle.solid, 500),
            backgroundColor: const Color.fromRGBO(15, 22, 36, 1),
            linearGradient: const LinearGradient(colors: [
              Pallete.lightPurple,
              Pallete.aquaBlue
            ]),
          ),
          const SizedBox(height: 15,), 
        ],
      ),
    );
  }
}
