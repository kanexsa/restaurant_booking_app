import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/color_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineMedium
          ?.copyWith(color: ColorConstants.onboardTitleTextColor),
    );
  }
}
