part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class CheckAuthorizationState extends LoginState {
  final bool userToken;

  CheckAuthorizationState(this.userToken);
}

class ValidateCodeState extends LoginState {
  final int phoneNumber;

  ValidateCodeState(this.phoneNumber);
}

class GoHomePageState extends LoginState {}
