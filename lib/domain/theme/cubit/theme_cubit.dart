import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(DarkTheme());

  void switchToDarkMode() {
    emit(DarkTheme());
  }

  void switchToLightMode() {
    emit(LightTheme());
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json["theme"] == "dark") {
      return DarkTheme();
    } else {
      return LightTheme();
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is DarkTheme) {
      return {"theme": "dark"};
    } else {
      return {"theme": "light"};
    }
  }
}
