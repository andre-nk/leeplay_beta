import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
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
}
