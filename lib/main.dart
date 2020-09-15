import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movit_bloc/bloc/film/film_bloc.dart';
import 'package:movit_bloc/ui/home/home_page.dart';
import 'package:movit_bloc/ui/login/login.dart';

import 'bloc/login_auth/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc()..add(AuthorizationCheckEvent()),
        ),
        BlocProvider<FilmBloc>(
          create: (context) => FilmBloc()..add(InitialRequestEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Evo Tv',
        theme: ThemeData.dark(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is CheckAuthorizationState) {
              if (state.userToken) {
                return HomePage();
              } else {
                return Login();
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

//ScrollBehaviorприведет к полному удалению эффекта свечения(при прокрутке)
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
