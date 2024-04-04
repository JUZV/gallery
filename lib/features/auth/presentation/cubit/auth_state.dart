abstract class AuthState {
  const AuthState();
}

class AuthInitState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {}

class LoginConnErrorState extends AuthState {}

class ChangePasswordVisibility extends AuthState {}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutErrorState extends AuthState {}
