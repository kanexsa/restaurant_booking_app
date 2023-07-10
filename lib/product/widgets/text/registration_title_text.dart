import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/color_constants.dart';

class RegistrationTitleText extends StatelessWidget {
  const RegistrationTitleText({super.key, required this.text, this.isChoose});

  final String text;
  final bool? isChoose;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: context.textTheme.titleMedium?.copyWith(
            color: isChoose ?? false
                ? ColorConstants.loginButtonTextColor
                : ColorConstants.registrationTextColor));
  }
}
