import 'package:flutter/material.dart';

class Gradianttext extends StatelessWidget {
  final Gradient gradient;
  final String text;
  final TextStyle? style;

  const Gradianttext(
      {super.key, required this.gradient, required this.text, this.style});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,maxLines: 1,softWrap: false, style: style),
    );
  }
}
