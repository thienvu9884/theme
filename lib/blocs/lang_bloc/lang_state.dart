import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LangState extends Equatable {
  const LangState();

  @override
  List<Object?> get props => [];
}

class LangInit extends LangState {
  const LangInit();
}

class LangLoading extends LangState {
  const LangLoading();
}

class LangLoadSuccess extends LangState {
  final Locale? locale;
  const LangLoadSuccess({this.locale});

  @override
  List<Object?> get props => [locale];
}

class LangLoadError extends LangState {
  final String? message;

  const LangLoadError({this.message});

  @override
  List<Object?> get props => [message];
}
