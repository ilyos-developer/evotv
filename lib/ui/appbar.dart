import 'package:flutter/material.dart';

import '../constants.dart';

class App extends StatelessWidget {
  String logoUrl;
  bool searchFilterVisible;
  Function callback;

  App({this.logoUrl, this.searchFilterVisible, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "EVO Movies",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: kTextFontFamily,
                  color: kPrimaryColor),
            ),
            searchFilterVisible
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.filter_list,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                        tooltip: "Filter",
                        onPressed: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            transitionDuration: Duration(milliseconds: 500),
                            barrierLabel:
                                MaterialLocalizations.of(context).dialogLabel,
                            barrierColor: Colors.black.withOpacity(0.5),
                            pageBuilder: (context, _, __) {


                              // return FilterScreen(this.callback);



                            },
                            transitionBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOut,
                                ).drive(Tween<Offset>(
                                  begin: Offset(0, -1.0),
                                  end: Offset.zero,
                                )),
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  )
                : Text(
                    "LOGO",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: kTextFontFamily,
                      color: kPrimaryColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
