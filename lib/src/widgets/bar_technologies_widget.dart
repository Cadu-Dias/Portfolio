import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:portifolio/pallete.dart';

class BarWidget extends StatefulWidget {
  final double containerWidth;
  final String technologieName;
  final String proficiency;
  final String barPercent;
  const BarWidget({super.key, required this.technologieName, required this.proficiency, required this.barPercent, required this.containerWidth});

  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
          
          const SizedBox(height: 10,),

          Align(
            alignment: AlignmentDirectional.topStart,
            child: FractionallySizedBox(
              
              widthFactor:double.parse(widget.barPercent),
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Pallete.lightPurple,
                  Pallete.aquaBlue
                  ]),
                  boxShadow: const [
                    BoxShadow(
                        color: Pallete.lightDarkBlue,
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 2),
                  ],
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,), 
        ],
      ),
    );
  }
}
