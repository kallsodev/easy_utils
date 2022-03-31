import 'package:easy_utils/src/logic/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  final Widget child;
  const ThemeButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().switchTheme();
      },
      child: child,
    );
  }
}
