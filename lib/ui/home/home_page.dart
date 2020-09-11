import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movit_bloc/ui/home/history_screen.dart';
import '../appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          height: size.height * 0.85,
          child: Column(
            children: [
              App(searchFilterVisible: false),
              SizedBox(height: size.height * 0.03),
              Expanded(
                child: ListView(
                  children: [
                    History(),
                    SizedBox(height: size.height * 0.03),
                    // ListView.builder(
                    //   physics: NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.vertical,
                    //   itemCount: categoriesList.length,
                    //   itemBuilder: (context, index) =>
                    //       buildCategoriesList(context, index),
                    // ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // GestureDetector buildCategoriesList(BuildContext context, int index) {
  //   return GestureDetector(
  //     onTap: () => Navigator.push(
  //       context,
  //       PageRouteBuilder(
  //         pageBuilder: (context, animation1, animation2) => CategoryDetails(),
  //       ),
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         CategoryCard(index: index),
  //       ],
  //     ),
  //   );
  // }
}
