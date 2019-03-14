import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  final String text;
  Quote({this.text});

  @override
  _QuoteState createState() => new _QuoteState();
}

class _QuoteState extends State<Quote> with TickerProviderStateMixin {
  AnimationController _quoteController;
  Animation<Offset> _quotePosition;
  Animation<double> _quoteOpacity;
  final Animatable<Offset> _quotePositionTween =
      Tween<Offset>(begin: const Offset(-5.0, 0.0), end: Offset.zero).chain(
    CurveTween(curve: Curves.easeOutQuint),
  );

  Future<void> animateQuote() async {
    await _quoteController.forward();
  }

  @override
  void initState() {
    super.initState();
    _quoteController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _quotePosition = _quoteController.drive(_quotePositionTween);
    _quoteOpacity =
        CurvedAnimation(parent: _quoteController, curve: Curves.easeOutCirc);
  }

  @override
  Widget build(BuildContext context) {
    animateQuote();
    return SlideTransition(
      position: _quotePosition,
      child: FadeTransition(
        opacity: _quoteOpacity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 4.0, color: Color(0XFFAFCBFF)),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Color(0XFF1C4C79),
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
              letterSpacing: 0.9,
            ),
          ),
        ),
      ),
    );
  }
}
