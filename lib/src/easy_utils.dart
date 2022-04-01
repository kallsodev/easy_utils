import 'dart:async';
import 'dart:developer';

import 'package:easy_utils/easy_utils.dart';
import 'package:easy_utils/src/logic/theme/app_bloc_observer.dart';
import 'package:easy_utils/src/logic/theme/theme_cubit.dart' if(dart.library.html) 'package:easy_utils/src/logic/theme/theme_cubit_web.dart';
import 'package:easy_utils/src/logic/theme/theme_cubit_layer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class EasyUtils {
  EasyUtils._();

  static switchTheme(BuildContext context, bool isDarkMode) {
    context.read<ThemeCubit>().setTheme(isDarkMode);
  }

  static init({required AppThemes appThemes, required Widget child, Function()? extraCalls}) {
    if(kIsWeb) {
      runZonedGuarded(
            () async {
          if(extraCalls != null) {
            await extraCalls();
          }
          await BlocOverrides.runZoned(
                  () async => runApp(
                ThemeCubitLayer(
                  child: child,
                  appThemes: appThemes,
                ),
              ),
              blocObserver: AppBlocObserver(),);
        },
            (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
      );
    } else {
      runZonedGuarded(
            () async {

          final tmpDir = await getTemporaryDirectory();
          final storage = await HydratedStorage.build(storageDirectory: tmpDir);
          if(extraCalls != null) {
            await extraCalls();
          }
          await HydratedBlocOverrides.runZoned(
                  () async => runApp(
                ThemeCubitLayer(
                  child: child,
                  appThemes: appThemes,
                ),
              ),
              blocObserver: AppBlocObserver(),
              storage: storage);
        },
            (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
      );
    }
  }
}
