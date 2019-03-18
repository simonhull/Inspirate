import 'package:flutter/material.dart';

class SlideFadeTransition extends StatefulWidget {
  double offsetX;
  double offsetY;
  final Curve positionCurve;
  final Curve opacityCurve;
  final Widget child;
  final Duration duration;

  SlideFadeTransition(
      {this.offsetX,
      this.offsetY,
      this.positionCurve,
      this.opacityCurve,
      this.child,
      this.duration});
  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with TickerProviderStateMixin {
  Animation<Offset> _position;
  Animation<double> _opacity;
  AnimationController _controller;
  static double offsetX = 0.0;
  static double offsetY = 0.0;
  static Curve positionCurve = Curves.bounceIn;

  final Animatable<Offset> _positionTween =
      Tween<Offset>(begin: Offset(offsetX, offsetY), end: Offset.zero).chain(
    CurveTween(curve: positionCurve),
  );

  @override
  void initState() {
    offsetX = widget.offsetX;
    offsetX = widget.offsetY;
    positionCurve = widget.positionCurve;
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _position = _controller.drive(_positionTween);
    _opacity = CurvedAnimation(parent: _controller, curve: widget.opacityCurve);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _position,
      child: FadeTransition(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
