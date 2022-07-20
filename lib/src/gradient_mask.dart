import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  const GradientMask({
    required this.child,
    Key? key,
    this.disableGredient = false,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFFFFFFFF),
        Color.fromARGB(255, 255, 162, 196),
        Color.fromARGB(255, 209, 97, 97),
        Color.fromARGB(255, 255, 116, 190),
      ],
    ),
    this.style,
  }) : super(key: key);

  final Widget child;
  final TextStyle? style;
  final Gradient gradient;
  final bool disableGredient;

  @override
  Widget build(BuildContext context) {
    if (disableGredient) return child;
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
