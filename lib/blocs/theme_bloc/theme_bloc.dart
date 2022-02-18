import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktesst/blocs/theme_bloc/theme_event.dart';
import 'package:ktesst/blocs/theme_bloc/theme_state.dart';
import 'package:ktesst/model/theme_model.dart';
// import 'package:ktesst/service/api_call.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // ApiClient apiClient = ApiClient();

  ThemeBloc() : super(const ThemeInit()) {
    on<RequestGetTheme>((event, emit) async {
      await _handleGetMTheme(emit, event);
    });
  }

  _handleGetMTheme(
    Emitter<ThemeState> emit,
    RequestGetTheme? event,
  ) async {
    emit(const ThemeLoading());
    try {
      emit(ThemeLoadSuccess(themeData: appThemeData[event?.theme]));
    } catch (e) {
      emit(ThemeLoadError(message: e.toString()));
    }
  }
}
