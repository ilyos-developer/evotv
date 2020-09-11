import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movit_bloc/bloc/login_auth/login_bloc.dart';
import 'package:movit_bloc/ui/login/validate_code.dart';

import '../../constants.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int phoneNumber;
    Size size = MediaQuery.of(context).size;
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)), //this right here
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF000000).withOpacity(0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Приветствуем вас!",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.07, right: size.width * 0.07),
                child: TextField(
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    labelText: "Ваш телефон номер",
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                      phoneNumber = int.parse(value);
                  },
                ),
              ),
              SizedBox(height: 33),
              SizedBox(
                height: 38,
                width: 265,
                child: FlatButton(
                  onPressed: () {
                    _bloc.add(SendedCodeEvent(phoneNumber));
                    print("line 76 $phoneNumber");
                    if (phoneNumber != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ValidateSMSCode()),
                      );
                    }
                  },
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Авторизироваться",
                    style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // }
    // return Center(
    //   child: CircularProgressIndicator(),
    // );
  }
}
