import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/locale.dart';
import 'package:ktesst/blocs/lang_bloc/lang_event.dart';
import 'package:ktesst/blocs/lang_bloc/lang_state.dart';
import 'package:ktesst/service/api_call.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostBloc extends Bloc<LangEvent, LangState> {
  ApiClient apiClient = ApiClient();

  PostBloc() : super(const LangInit()) {
    Locale? locale;
    on<RequestGetLang>((event, emit) async {
      await _handleGetDataMovie(emit, locale);
    });
  }

  _handleGetDataMovie(Emitter emit, locale) async {
    emit(const LangLoading());
    try {
      var prefs = await SharedPreferences.getInstance();
      emit(LangLoadSuccess());
    } catch (e) {
      emit(LangLoadError(message: e.toString()));
    }
  }
}
