part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class DarkTheme extends ThemeState {}

class LightTheme extends ThemeState {}
