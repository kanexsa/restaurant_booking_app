import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../enums/button_size.dart';

class CreateAndLoginButton extends StatelessWidget {
  CreateAndLoginButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text});

  Color backgroundColor;
  Color textColor;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(ButtonSize.buttonNormal.value.toDouble()),
            padding: context.paddingLow,
            backgroundColor: backgroundColor),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container();
            },
          );
        },
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ));
  }
}
