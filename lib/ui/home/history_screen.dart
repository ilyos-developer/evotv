import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text("бесплатное", overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text("премьера", overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text("съемки", overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child:
                        Text("качественный", overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                        "беkdasdjaslddaskld aslad askd askdnasjkljzkc casljdsald sadklasjdas daslkdasld salkdasjd askdklasd asld ",
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            width: 80,
          ),
        ],
      ),
    );
  }
}
