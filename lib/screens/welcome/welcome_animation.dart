import 'package:flutter/material.dart';

class WelcomeEnterAnimation {
  WelcomeEnterAnimation(this.controller)
      : titleLabelOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.6,
              1.0,
              curve: Curves.easeIn,
            ),
          ),
        ),
        translation = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.1,
              0.5,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        scaleTranslation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.7,
              0.9,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> titleLabelOpacity;
  final Animation<double> translation;
  final Animation<double> scaleTranslation;
}
