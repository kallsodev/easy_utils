import 'package:flutter/material.dart';

class WSpace extends StatelessWidget {
  final double size;
  const WSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
