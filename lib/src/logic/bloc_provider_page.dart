import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderPage <T extends StateStreamableSource<Object?>>  extends StatelessWidget {
  final T bloc;

  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final EdgeInsetsGeometry padding;
  final bool scaffold;

  final Widget child;

  const BlocProviderPage(
      {Key? key,
        this.appBar,
        required this.bloc,
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
      body: BlocProvider<T>(
        create: (_) => bloc,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    )
        : BlocProvider<T>(
      create: (_) => bloc,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}