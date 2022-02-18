import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktesst/blocs/post_bloc.dart';
import 'package:ktesst/blocs/theme_bloc/theme_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<PostBloc>(
        create: (BuildContext context) => PostBloc(),
      ),
      BlocProvider<ThemeBloc>(
        create: (BuildContext context) => ThemeBloc(),
      ),
    ];
  }
}
