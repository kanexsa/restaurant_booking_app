import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/color_constants.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingMedium,
      child: Text(
        text,
        style: context.textTheme.labelSmall
            ?.copyWith(color: ColorConstants.onboardSubtitleTextColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
