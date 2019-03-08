import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspirate',
      theme: ThemeData(fontFamily: 'koliko'),
      home: Scaffold(
          body: Container(
        padding: EdgeInsets.only(top: 100.0, bottom: 40.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  HSLColor.fromAHSL(1.0, 219.0, 1.0, 0.95).toColor(),
                  HSLColor.fromAHSL(1.0, 209.0, 0.93, 0.92).toColor(),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1])),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 4.0, color: Color(0XFFAFCBFF)),
                ),
              ),
              child: Text(
                'Everyone has inside them a piece of good news. The good news is you don’t know how great you can be! How much you can love! What you can accomplish! And what your potential is. ',
                style: TextStyle(
                  color: Color(0XFF1C4C79),
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0,
                  letterSpacing: 0.9,
                ),
              ),
            ),
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                        child: Card(
                        margin: EdgeInsets.only(left: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                          ),
                        elevation: 0.0,
                        color: Color(0XFFF0F8FF),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 12.0),
                          width: 200.0,
                          height: 76.0,
                          child: Text(
                            'Need Inspiration?',
                            style: TextStyle(
                              color: Color(0XFF1C4C79),
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top:24.0),),
                    FloatingActionButton(
                      child: Image.asset('assets/images/smile.png'),
                      onPressed: () {},
                    ),
                  ]),
            ),
          ],
        ),
      )),
    );
  }
}
