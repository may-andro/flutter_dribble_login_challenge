import 'package:flutter/material.dart';
import 'package:login_dribble_challenge/components/forward_button.dart';
import 'package:login_dribble_challenge/components/header_text.dart';
import 'package:login_dribble_challenge/components/trapozoid_cut_colored_image.dart';
import 'package:login_dribble_challenge/screens/login/login_animation.dart';
import 'package:login_dribble_challenge/utility/app_constant.dart';
import 'package:login_dribble_challenge/utility/color_utility.dart';

abstract class GoToWelcomeListener {
  void onGoToWelcomeTap();
}

class LoginPage extends StatelessWidget {
  LoginPage(
      {@required AnimationController controller,
      @required this.goToWelcomeListener})
      : enterAnimation = new LoginEnterAnimation(controller);

  final GoToWelcomeListener goToWelcomeListener;
  final LoginEnterAnimation enterAnimation;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: <Widget>[
        _trapoziodView(size, textTheme),
        _buttonContainer(size, textTheme),
      ],
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, -enterAnimation.Ytranslation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(size),
            _buildTextHeader(size, textTheme),
            _buildForm(size, textTheme)
          ],
        ),
      )),
    );
  }

  Widget _buildForm(Size size, TextTheme textTheme) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.3, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: _buildTextFormUsername(textTheme),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: 12),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                    width: enterAnimation.dividerScale.value *
                        size.width,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                  ),
                  child: _buildTextFormPassword(textTheme),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildTextFormUsername(TextTheme textTheme) {
    return FadeTransition(
      opacity: enterAnimation.userNameOpacity,
      child: TextFormField(
        style: textTheme
            .title
            .copyWith(color: Colors.black87, letterSpacing: 1.2),
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: PHONE_AUTH_HINT,
          hintStyle:
              textTheme.subhead.copyWith(color: Colors.grey),
          icon: Icon(
            Icons.person,
            color: Colors.black87,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        keyboardType: TextInputType.text,
        controller: userNameController,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buildTextFormPassword(TextTheme textTheme) {
    return FadeTransition(
      opacity: enterAnimation.passowrdOpacity,
      child: TextFormField(
        style:textTheme
            .title
            .copyWith(color: Colors.black87, letterSpacing: 1.2),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: PASSWORD_AUTH_HINT,
            hintStyle:textTheme
                .subhead
                .copyWith(color: Colors.grey),
            contentPadding: EdgeInsets.zero,
            icon: Icon(Icons.lock, color: Colors.black87)),
        keyboardType: TextInputType.text,
        controller: passwordController,
        obscureText: true,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buttonContainer(Size size, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildSocialMediaAppButton(COLOR_GOOGLE, IMAGE_PATH_GOOGLE,
                40, enterAnimation.googleScaleTranslation.value),
            SizedBox(
              width: 8,
            ),
            _buildSocialMediaAppButton(COLOR_FACEBOOK, IMAGE_PATH_FACEBOOK,
                48, enterAnimation.facebookScaleTranslation.value),
            SizedBox(
              width: 8,
            ),
            _buildSocialMediaAppButton(COLOR_TWITTER, IMAGE_PATH_TWITTER,
                56, enterAnimation.twitterScaleTranslation.value),
            SizedBox(
              width: size.width * 0.1,
            ),
            Transform(
              transform: Matrix4.translationValues(
                  enterAnimation.translation.value * 200, 0.0, 0.0),
              child: ForwardButton(
                onPressed: () {
                  goToWelcomeListener.onGoToWelcomeTap();
                },
                label: BUTTON_PROCEED,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaAppButton(
      String color, String image, double size, double animatedValue) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(animatedValue, animatedValue, 0.0),
      child: InkWell(
        onTap: null,
        child: Container(
          height: size,
          width: size,
          padding: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Color(getColorHexFromStr(color)),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3),
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: new AssetImage(IMAGE_LOGIN_PATH),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.overlay)),
        ),
      ),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          -enterAnimation.Xtranslation.value * size.width, 0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: HeaderText(text: TEXT_SIGN_IN_LABEL, imagePath: IMAGE_SLIPPER_PATH,),
      ),
    );
  }
}
