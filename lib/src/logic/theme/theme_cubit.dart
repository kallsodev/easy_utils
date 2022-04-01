import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
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

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return json['isDark'] as bool
        ? ThemeState(appThemes.darkTheme)
        : ThemeState(appThemes.lightTheme);
  }

  @override
  Map<String, bool>? toJson(ThemeState state) {
    return {'isDark': state.themeData.brightness == Brightness.dark};
  }
}
