part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class InitialSendingEvent extends LoginEvent {}

class SendedCodeEvent extends LoginEvent {
  final int phoneNumber;

  SendedCodeEvent(this.phoneNumber);
}

class LogedEvent extends LoginEvent {
  final int phoneNumber, code;

  LogedEvent(this.phoneNumber, this.code) : assert(phoneNumber != null, code != null);
}
