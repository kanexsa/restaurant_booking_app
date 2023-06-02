import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_booking_app/product/constants/string_constants.dart';
import 'package:restaurant_booking_app/product/enums/image_constants.dart';
import 'package:restaurant_booking_app/product/widgets/image/splash_login_welcome_pages_images.dart';
import 'package:restaurant_booking_app/product/widgets/text/sub_title_text.dart';
import 'package:restaurant_booking_app/product/widgets/text/title_text.dart';

import '../../product/constants/color_constants.dart';
import '../../product/widgets/buttons/create_and_login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_mainWidget(), _bottomWidget()],
        ),
      ),
    );
  }
}

class _bottomWidget extends StatelessWidget {
  const _bottomWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CreateAndLoginButton(
          backgroundColor: ColorConstants.onboardIndicatorColor,
          textColor: ColorConstants.backgroundColor,
          text: StringConstants.createAccountButtonText,
        ),
        Padding(
          padding: context.paddingLow,
          child: CreateAndLoginButton(
            backgroundColor: ColorConstants.loginButtonColor,
            textColor: ColorConstants.loginButtonTextColor,
            text: StringConstants.loginButtonText,
          ),
        ),
        Padding(
          padding: context.paddingLow,
          child: const Align(
              alignment: Alignment.center,
              child: SubTitleText(
                  text:
                      'By logging in or registering, you have agreed to the Terms and Conditions and Privacy Policy.')),
        )
      ],
    );
  }
}

class _mainWidget extends StatelessWidget {
  const _mainWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: context.paddingMedium,
            child: SplashLoginWelcomePagesImages(
                imagePath: ImageConstants.welcomePageImage.imageWithPath),
          ),
          const TitleText(text: StringConstants.welcomePageTitle),
          const SubTitleText(text: StringConstants.welcomePageSubtitle)
        ],
      ),
    );
  }
}
