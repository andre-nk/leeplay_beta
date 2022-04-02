part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final UserProfile? userProfile;
  final String? errorMessage;
  final bool isAuthenticated;

  const AuthState({
    this.userProfile,
    this.errorMessage,
    this.isAuthenticated = false,
  });

  @override
  List<Object> get props => [];

  AuthState copyWith({
    UserProfile? userProfile,
    String? errorMessage,
    bool? isAuthenticated = false,
  }){
    return AuthState(
      userProfile: userProfile ?? this.userProfile,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated
    );
  }
}
