import 'package:flutter/material.dart';
import 'package:movit_bloc/models/categories.dart';
import '../constants.dart';

class CategoryCard extends StatelessWidget {
  final int index;

  CategoryCard({this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xff000000).withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.045),
                child: Text(categoriesList[index].categoryName,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: kTextFontFamily,
                      color: kTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 60,
                width: size.width * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(categoriesList[index].image),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.025),
      ],
    );
  }
}
