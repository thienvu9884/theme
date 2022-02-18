import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ktesst/model/post_model.dart';

abstract class ThemeState extends Equatable {
  final ThemeData? themeData;
  const ThemeState({this.themeData});

  @override
  List<Object?> get props => [themeData];
}

class ThemeInit extends ThemeState {
  const ThemeInit();
}

class ThemeLoading extends ThemeState {
  const ThemeLoading();
}

class ThemeLoadSuccess extends ThemeState {
  final ThemeData? themeData;

  const ThemeLoadSuccess({this.themeData});

  @override
  List<Object?> get props => [themeData];
}

class ThemeLoadError extends ThemeState {
  final String? message;

  const ThemeLoadError({this.message});

  @override
  List<Object?> get props => [message];
}
