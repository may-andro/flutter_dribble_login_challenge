import 'package:flutter/material.dart';
import 'package:login_dribble_challenge/utility/color_utility.dart';

class ForwardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  ForwardButton(
      {this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: new BorderRadius.only(
        topLeft: new Radius.circular(30.0),
        bottomLeft: new Radius.circular(30.0),
      ),
      child: new MaterialButton(
          elevation: 12.0,
          minWidth: 70.0,
          color: Color(getColorHexFromStr('#667898')),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
            child: Text(label, style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),),
          )),
    );
  }
}
