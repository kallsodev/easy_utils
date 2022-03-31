import 'package:easy_utils/easy_utils.dart';
import 'package:easy_utils/src/logic/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EasyTheme {
  EasyTheme._();

  static switchTheme(BuildContext context, bool isDarkMode) {
    context.read<ThemeCubit>().setTheme(isDarkMode);
  }

  static init({required AppThemes appThemes, required Widget child}) {
    return BlocProviderPage(
      scaffold: false,
      bloc: ThemeCubit(appThemes),
      child: child,
    );
  }
}
