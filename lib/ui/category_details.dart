import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movit_bloc/bloc/film/film_bloc.dart';
import 'package:movit_bloc/models/films.dart';

import '../constants.dart';
import 'appbar.dart';
import 'film_card.dart';

class CategoryDetails extends StatelessWidget {
  final List<Film> films;
  Map filters;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CategoryDetails({this.films});

  void getFilters(Map filters) {
    // setState(() {
      this.filters = filters;
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              App(
                searchFilterVisible: true,
                callback: this.getFilters,
              ),
              Container(
                height: size.height * 0.78,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                              top: size.height * 0.05),
                          height: size.height * 0.4,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/venom.jpg'),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color(0xff000000).withOpacity(0.6),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Фильмы",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: kTextFontFamily,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Column(
                                children: [
                                  _buildHashtegs(size, "#Топ20", "#Семейное"),
                                  SizedBox(height: size.height * 0.01),
                                  _buildHashtegs(size, "#Комедия", "#Юмор"),
                                  SizedBox(height: size.height * 0.01),
                                  _buildHashtegs(size, "#Семейное", "#Фантастикa"),
                                  SizedBox(height: size.height * 0.01),
                                  _buildHashtegs(size, "#Новинки", "#Топ50"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _buildFilms(context)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHashtegs(Size size, String str1, str2) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.05,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(30)),
            color:
            Color(0xff000000).withOpacity(1),
            border: Border.all(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  str1,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: kTextFontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.05,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(30)),
            color:
            Color(0xff000000).withOpacity(1),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  str2,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: kTextFontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BlocListener _buildFilms(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<FilmBloc>(context),
      listener: (BuildContext context, state) {
        // if (state is GoHomePageState) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => HomePage(),
        //     ),
        //   );
        // }
      },
      child: BlocBuilder<FilmBloc, FilmState>(builder: (context, state) {
        if (state is FilmInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedFilmState) {
          print("line 209 ${state.films[1].title}");
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.films.length,
            itemBuilder: (context, index) => FilmCard(
              films: state.films,
              index: index,
            ),
          );
        }
        return Center(
          child: Text("asldk"),
        );
      }),
    );
  }
}
