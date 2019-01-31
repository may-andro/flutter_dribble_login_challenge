import 'package:flutter/material.dart';

class LoginEnterAnimation {
  LoginEnterAnimation(this.controller)
      : backgroundOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.2,
              curve: Curves.easeIn,
            ),
          ),
        ),
        userNameOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.55,
              0.7,
              curve: Curves.easeIn,
            ),
          ),
        ),
        passowrdOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.8,
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
        Xtranslation = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.45,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        Ytranslation = new Tween(begin: 1.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.4,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        twitterScaleTranslation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.4,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        dividerScale = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.65,
              0.8,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        facebookScaleTranslation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.6,
              0.8,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        googleScaleTranslation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> backgroundOpacity;
  final Animation<double> userNameOpacity;
  final Animation<double> dividerScale;
  final Animation<double> passowrdOpacity;
  final Animation<double> translation;
  final Animation<double> Xtranslation;
  final Animation<double> Ytranslation;
  final Animation<double> twitterScaleTranslation;
  final Animation<double> facebookScaleTranslation;
  final Animation<double> googleScaleTranslation;
}
