import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../bloc_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    emit(ThemeState(
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
