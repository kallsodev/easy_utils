import 'package:easy_utils/src/ui/rounded_container.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final double? roundness;
  final Border? border;
  final Color? color;
  final Function() onTap;

  const RoundedButton(
      {Key? key, required this.child, this.roundness, this.border, this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        child: child,
        roundness: roundness,
        border: border,
        color: color,
      ),
    );
  }
}
