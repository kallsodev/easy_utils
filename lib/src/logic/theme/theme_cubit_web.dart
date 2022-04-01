import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_themes.dart';

part 'theme_state_web.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final AppThemes appThemes;

  ThemeCubit(this.appThemes) : super(ThemeState(appThemes.lightTheme));

  void setTheme(bool isDarkMode) {
    emit(
      isDarkMode
          ? ThemeState(appThemes.darkTheme)
          : ThemeState(appThemes.lightTheme),
    );
  }

  void switchTheme() {
    emit(
      state.themeData.brightness == Brightness.light
          ? ThemeState(appThemes.darkTheme)
          : ThemeState(appThemes.lightTheme),
    );
  }
}
