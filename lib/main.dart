import 'package:flutter/material.dart';
import './widgets/smile-button.dart';
import './widgets/quote.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isQuoteShown = false;
  getQuote() {
    setState(() {
      this.isQuoteShown = true;
    });
  }

  Widget quoteBuilder() {
    if (!this.isQuoteShown) {
      return Container();
    } else {
      //TODO get new quote.
      return Quote(
          text:
              'Everyone has inside them a piece of good news. The good news is you don’t know how great you can be! How much you can love! What you can accomplish! And what your potential is.');
    }
  }

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
            Expanded(
              child: quoteBuilder(),
            ),
            SmileButton(
              onButtonPressed: this.getQuote,
            ),
          ],
        ),
      )),
    );
  }
}
