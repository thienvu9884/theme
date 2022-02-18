import 'package:equatable/equatable.dart';
import 'package:ktesst/model/theme_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetTheme extends ThemeEvent {
  final AppTheme? theme;

  const RequestGetTheme({this.theme});

  @override
  List<Object?> get props => [theme];
}
