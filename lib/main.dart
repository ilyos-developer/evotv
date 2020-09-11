import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          create: (context) => LoginBloc()..add(InitialSendingEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Movit',
        theme: ThemeData.dark(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => Login(), settings: routeSettings);
            default:
              return MaterialPageRoute(
                  builder: (context) => Login(), settings: routeSettings);
              break;
          }
        },
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