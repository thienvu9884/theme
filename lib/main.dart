import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktesst/blocs/main_blocs.dart';
import 'package:ktesst/blocs/theme_bloc/theme_bloc.dart';
import 'package:ktesst/blocs/theme_bloc/theme_state.dart';
import 'package:ktesst/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MainBloc.allBlocs(),
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: _buildTheme));
  }

  Widget _buildTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: state.themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      home: const HomeScreen(),
    );
  }
}
