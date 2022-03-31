import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double? roundness;
  final Widget child;
  final Border? border;
  final Color? color;

  const RoundedContainer({Key? key, this.roundness = 8, required this.child, this.border, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(roundness!),
        border: border,
      ),
      child: child,
    );
  }
}
