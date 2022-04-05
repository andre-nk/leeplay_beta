import 'package:equatable/equatable.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(const AuthState());

  final AuthRepository _authRepository;

  Future<void> getCurrentUser() async {
    try {
      UserProfile _currentUser = await _authRepository.currentUser();
      emit(AuthState(userProfile: _currentUser, isAuthenticated: true));
    } catch (e) {
      emit(AuthState(errorMessage: e.toString(), isAuthenticated: false));
    }
  }

  Future<void> loginWithLine() async {
    try {
      UserProfile _currentUser = await _authRepository.loginWithLine();
      emit(AuthState(userProfile: _currentUser, isAuthenticated: true));
    } catch (e) {
      emit(AuthState(errorMessage: e.toString(), isAuthenticated: false));
    }
  }

  Future<void> logoutWithLine() async {
    try {
      await _authRepository.logoutWithLine();
      emit(const AuthState(isAuthenticated: false));
      
    } catch (e) {
      emit(AuthState(errorMessage: e.toString(), isAuthenticated: false));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthState(
        isAuthenticated: json["isAuthenticated"],
        errorMessage: json["errorMessage"]
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    try {
      return {
        "isAuthenticated": state.isAuthenticated,
        "errorMessage": state.errorMessage
      };
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
