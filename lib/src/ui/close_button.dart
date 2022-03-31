import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  final Function()? onClose;
  final Widget? child;
  const CloseButton({Key? key, this.onClose, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onClose != null) {
          onClose!();
        }
        Navigator.pop(context);
      },
      child: child ?? const Icon(Icons.close,),
    );
  }
}
