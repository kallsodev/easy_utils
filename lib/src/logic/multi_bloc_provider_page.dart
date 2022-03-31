import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderPage extends StatelessWidget {
  final List<StateStreamableSource<Object?>> blocs;

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final EdgeInsetsGeometry padding;
  final bool scaffold;

  final Widget child;

  const MultiBlocProviderPage(
      {Key? key,
      this.appBar,
      required this.blocs,
      required this.child,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.scaffold = true,
      this.floatingActionButtonLocation,
      this.drawer,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold
        ? Scaffold(
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            drawer: drawer,
            appBar: appBar,
            body: MultiBlocProvider(
              providers: blocs.map((bloc) => BlocProvider(create: (_) => bloc)).toList(),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          )
        : MultiBlocProvider(
            providers: blocs.map((bloc) => BlocProvider(create: (_) => bloc)).toList(),
            child: Padding(
              padding: padding,
              child: child,
            ),
          );
  }
}
