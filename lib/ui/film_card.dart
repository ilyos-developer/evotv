import 'package:flutter/material.dart';
import 'package:movit_bloc/models/films.dart';

import '../constants.dart';

class FilmCard extends StatefulWidget {
  List<Film> films;
  int index;
  FilmCard({Key key, this.films, this.index}) : super(key: key);

  @override
  _FilmCardState createState() => _FilmCardState(films: films, index: index);
}

class _FilmCardState extends State<FilmCard> {
  List<Film> films;
  int index;

  _FilmCardState({this.films, this.index});

  @override
  void initState() {
    super.initState();
  }
  // FutureBuilder _buildFilmsDetails() {
  //   return FutureBuilder(
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text(
  //           snapshot.error.toString(),
  //         );
  //       }
  //       if (!snapshot.hasData) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       return MovieDetails(
  //         filmDetails: snapshot.data,
  //       );
  //     },
  //     future: ApiClient().getFilmsDetail(slug: films[index].slug),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String genre = films[index].genres.map((e) => e.name).toString();
    String countries = films[index].countries.map((e) => e.name).toString();
    countries = countries.substring(1, countries.length-1);
    genre = genre.substring(1, genre.length-1);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation1, animation2) => _buildFilmsDetails(),
        //   ),
        // );
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.025),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  FittedBox(
                    child: Container(
                      height: (size.height < 700)
                          ? (size.height * 0.29)
                          : (size.height * 0.20),
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("http://evoit.uz${films[index].posterOriginal}"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: (size.height < 700)
                        ? (size.height * 0.29)
                        : (size.height * 0.20),
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * 0.5,
                              child: Text(
                                films[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                    fontFamily: kTextFontFamily),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.009),
                        Text(
                          "Год выпуска: ${films[index].year}",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          "Страна: $countries",
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          "Жанры: $genre",
                          maxLines: 2,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: size.height * 0.006),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Рейтинг: ",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              // SvgPicture.asset('assets/icons/imdb.svg',
                              //     width: 15, height: 15),
                              SizedBox(width: 5),
                              Text(
                                films[index].ratingImdb.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(width: 10),
                              // SvgPicture.asset('assets/icons/kinopoisk.svg',
                              //     width: 18, height: 18),
                              SizedBox(width: 5),
                              Text(
                                films[index].ratingKp.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
