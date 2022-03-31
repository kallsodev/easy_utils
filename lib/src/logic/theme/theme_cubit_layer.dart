import 'package:easy_utils/easy_utils.dart';
import 'package:easy_utils/src/logic/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubitLayer extends StatelessWidget {
  final AppThemes appThemes;
  final Widget child;
  const ThemeCubitLayer({Key? key, required this.appThemes, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ThemeCubit(appThemes),
    child: child,);
  }
}
