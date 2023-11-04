import 'package:flutter/material.dart';
import 'package:portifolio/pallete.dart';
import 'package:portifolio/src/utils/size_screen_util.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class ProfileAnimation extends StatefulWidget {
  final double containerWidth;

  const ProfileAnimation({super.key, required this.containerWidth});

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _animation = Tween(begin: const Offset(0, 0.1), end: const Offset(0, 0.2))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: widget.containerWidth - 120, // Largura disponível
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: context.screenSize().width < 500 ? 270 : kIsWeb? 270 : 400,
              width: context.screenSize().width < 500 ? 270 : kIsWeb? 270 : 400,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Pallete.lightPurple, Pallete.aquaBlue]),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Container(
              height: context.screenSize().width < 500 ? 250 :  kIsWeb? 250 : 375,
              width: context.screenSize().width < 500 ? 250 :  kIsWeb? 250 : 375,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      "assets/images/foto_portifolio_pretobranco.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(190),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
