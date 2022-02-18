import 'package:equatable/equatable.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetLang extends LangEvent {
  const RequestGetLang();

  @override
  List<Object?> get props => [];
}