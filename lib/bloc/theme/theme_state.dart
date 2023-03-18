part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState([this.themeMode = ThemeMode.system]);

  @override
  List<Object> get props => [themeMode];

  Map<String, dynamic> toJson() {
    return {'themeMode': themeMode.toString()};
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(ThemeMode.values
        .firstWhere((element) => element.toString() == json['themeMode']));
  }
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(ThemeMode.system);
}
