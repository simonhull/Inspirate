import 'package:flutter/material.dart';
import 'dart:async';

class SmileButton extends StatefulWidget {
  final Function onButtonPressed;
  SmileButton({
    this.onButtonPressed,
  });
  @override
  _SmileButtonState createState() => new _SmileButtonState();
}

class _SmileButtonState extends State<SmileButton>
    with TickerProviderStateMixin {
  bool isButtonAnimationFinished = false;
  AnimationController _buttonController;
  AnimationController _speechBubbleController;
  Animation<double> _speechBubbleOpacity;
  Animation<Offset> _speechBubblePosistion;
  Animation<Offset> _buttonPosition;
  final Animatable<Offset> _buttonPositionTween =
      Tween<Offset>(begin: const Offset(0.0, 5.0), end: Offset.zero).chain(
    CurveTween(curve: Curves.easeOutQuint),
  );
  final Animatable<Offset> _speechBubblePositionTween =
      Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).chain(
    CurveTween(curve: Curves.elasticOut),
  );

  Future<void> animateButton() async {
    await _buttonController.forward();
    await _speechBubbleController.forward();
    Timer(Duration(seconds: 2), () => {_speechBubbleController.reverse()});
  }

  @override
  void initState() {
    super.initState();
    _speechBubbleController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _buttonController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _buttonPosition = _buttonController.drive(_buttonPositionTween);
    _speechBubblePosistion =
        _speechBubbleController.drive(_speechBubblePositionTween);
    _speechBubbleOpacity = CurvedAnimation(
        parent: _speechBubbleController, curve: Curves.easeOutCirc);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animateButton();
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SlideTransition(
          position: _speechBubblePosistion,
          child: FadeTransition(
            opacity: _speechBubbleOpacity,
            child: Align(
              alignment: Alignment.topLeft,
              child: Card(
                margin: EdgeInsets.only(left: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
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
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24.0),
          child: SlideTransition(
            position: _buttonPosition,
            child: FloatingActionButton(
              elevation: 6.0,
              child: Image.asset('assets/images/smile.png'),
              onPressed: () => widget.onButtonPressed(),
            ),
          ),
        ),
      ]),
    );
  }
}
