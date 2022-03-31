import 'dart:typed_data';

import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final Uint8List? bytes;
  final String? url;
  final double size;
  final String? letter;

  const AvatarContainer({
    Key? key,
    this.bytes,
    required this.size,
    this.url,
    this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: bytes != null
              ? Image.memory(
                  bytes!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              : letter == null
                  ? Image.network(
                      url!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey,
                      width: size,
                      height: size,
                      child: Center(
                        child: Text(
                          letter ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: size / 5 * 3),
                        ),
                      ),
                    ),
        ),
      ],
    );
  }
}
