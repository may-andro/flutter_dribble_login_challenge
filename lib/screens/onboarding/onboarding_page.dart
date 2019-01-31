import 'package:flutter/material.dart';
import 'package:login_dribble_challenge/screens/login/login_page.dart';
import 'package:login_dribble_challenge/screens/onboarding/onboarding_animation.dart';
import 'package:login_dribble_challenge/screens/welcome/welcome_page.dart';
import 'package:login_dribble_challenge/utility/app_constant.dart';
import 'package:login_dribble_challenge/utility/color_utility.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin implements GoToLoginListener, GoToWelcomeListener{

  AnimationController animationControllerWelcome;
  AnimationController animationControllerLogin;

  OnBoardingEnterAnimation onBoardingEnterAnimation;
  
  int _contentScreenState;

  @override
  void initState() {
    super.initState();

    animationControllerLogin = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 1;
            });
            animationControllerWelcome.forward();
            break;
        }
      })..addListener(() {
        setState(() {

        });
      });

    animationControllerWelcome = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 2;
            });
            animationControllerLogin.forward();
            break;
        }
      })..addListener(() {
        setState(() {

        });
      });

    setState(() {
      _contentScreenState = 1;
    });

    onBoardingEnterAnimation = OnBoardingEnterAnimation(animationControllerLogin);

    animationControllerWelcome.forward();
  }

  @override
  void dispose() {
    animationControllerWelcome.dispose();
    animationControllerLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onBoardingEnterAnimation.colorAnimation.value,
      body: getCurrentWidget()
    );
  }

  @override
  void onGoAheadTap() {
    animationControllerWelcome.reverse();
  }

  Widget getCurrentWidget() {
    switch(_contentScreenState) {
      case 1: return WelcomePage(controller: animationControllerWelcome, goTOLoginListener: this);
      case 2: return LoginPage(controller: animationControllerLogin, goToWelcomeListener: this);
      default: return Offstage();
    }
  }

  @override
  void onGoToWelcomeTap() {
    animationControllerLogin.reverse();
  }
}
