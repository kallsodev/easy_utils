import 'dart:async';
import 'dart:developer';

import 'package:easy_utils/easy_utils.dart';
import 'package:easy_utils/src/logic/theme/app_bloc_observer.dart';
import 'package:easy_utils/src/logic/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class EasyTheme {
  EasyTheme._();

  static switchTheme(BuildContext context, bool isDarkMode) {
    //context.read<ThemeCubit>().setTheme(isDarkMode);
  }

  static init({required AppThemes appThemes, required Widget child}) {
    runZonedGuarded(
          () async {
            final tmpDir = await getTemporaryDirectory();
            final storage = await HydratedStorage.build(storageDirectory: tmpDir);
        await HydratedBlocOverrides.runZoned(
              () async => runApp(BlocProvider(
                create: (_) => ThemeCubit(appThemes),
                child: child,
              )),
          blocObserver: AppBlocObserver(),
          storage: storage
        );
      },
          (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
    );
  }
}
