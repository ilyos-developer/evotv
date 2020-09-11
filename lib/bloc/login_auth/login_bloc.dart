import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:movit_bloc/models/user.dart';
import 'package:movit_bloc/repositories/http_client.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final _storage = new FlutterSecureStorage();

  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SendedCodeEvent) {
      yield LoginInitialState();
      try {
        await HttpClient.fetchSendPhoneNumber(event.phoneNumber);
        yield ValidateCodeState(event.phoneNumber);
        print(event.phoneNumber);
      } catch (e) {
        print(e);
      }
    }
    if (event is LogedEvent) {
      try {
        User user = await HttpClient.fetchValidateCode(event.phoneNumber, event.code);
        if(user.status == "ok") {
          await _storage.write(key: 'userToken', value: user.token);
          yield GoHomePageState();
        } else {
          print(user.message);
          yield ValidateCodeState(event.phoneNumber); // для теста
          print(user.status);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
