import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  final double size;
  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
