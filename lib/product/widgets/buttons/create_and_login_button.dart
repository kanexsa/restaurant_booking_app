import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_booking_app/product/constants/color_constants.dart';
import 'package:restaurant_booking_app/product/constants/string_constants.dart';
import 'package:restaurant_booking_app/product/enums/divider_size.dart';
import 'package:restaurant_booking_app/product/enums/image_constants.dart';

import '../../enums/button_size.dart';
import '../text/registration_title_text.dart';

class CreateAndLoginButton extends StatelessWidget {
  CreateAndLoginButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      required this.isLogin,
      required this.isCreate});

  Color backgroundColor;
  Color textColor;
  String text;
  bool isLogin;
  bool isCreate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(ButtonSize.buttonNormal.value.toDouble()),
            padding: context.paddingLow,
            backgroundColor: backgroundColor),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: ColorConstants.backgroundColor,
            context: context,
            builder: (context) {
              return SizedBox(
                height: context.height * 0.75,
                child: Padding(
                  padding: context.paddingLow,
                  child: Column(
                    children: [
                      Divider(
                        color: ColorConstants.dividerLineColor,
                        thickness:
                            DividerSize.dividerThickness.value.toDouble(),
                        endIndent: DividerSize.dividerNormal.value.toDouble(),
                        indent: DividerSize.dividerNormal.value.toDouble(),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: context.paddingMedium,
                            margin: context.onlyRightPaddingMedium,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RegistrationTitleText(
                                  text: StringConstants.createAccountButtonText,
                                  isChoose: isCreate,
                                ),
                                RegistrationTitleText(
                                  text: StringConstants.loginButtonText,
                                  isChoose: isLogin,
                                ),
                              ],
                            ),
                          ),
                          isLogin
                              ? Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: context.onlyLeftPaddingLow,
                                        child: Text(
                                          "Email Adress",
                                          style: context.textTheme.titleMedium
                                              ?.copyWith(
                                                  color: ColorConstants
                                                      .registrationTextFormFieldColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        validator: (value) =>
                                            value.isNullOrEmpty
                                                ? 'Not empty'
                                                : null,
                                        decoration: const InputDecoration(
                                          hintText: "Enter your full name",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16))),
                                        ),
                                      ),
                                      Padding(
                                        padding: context.onlyLeftPaddingLow,
                                        child: Text(
                                          "Password",
                                          style: context.textTheme.titleMedium
                                              ?.copyWith(
                                                  color: ColorConstants
                                                      .registrationTextFormFieldColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        validator: (value) =>
                                            value.isNullOrEmpty
                                                ? 'Not empty'
                                                : null,
                                        decoration: const InputDecoration(
                                          hintText: "*********",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16))),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              StringConstants
                                                  .forgotPasswordText,
                                              style: context
                                                  .textTheme.titleMedium
                                                  ?.copyWith(
                                                      color: ColorConstants
                                                          .onboardIndicatorColor),
                                            )),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size.fromWidth(
                                                        ButtonSize
                                                            .buttonNormal.value
                                                            .toDouble()),
                                                    padding: context.paddingLow,
                                                    backgroundColor: ColorConstants
                                                        .registrationButtonBackgroundColor),
                                                onPressed: () {},
                                                child: Text(
                                                  StringConstants
                                                      .loginButtonText,
                                                  style: context
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          color: ColorConstants
                                                              .registrationButtonTextColor),
                                                )),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size.fromWidth(
                                                        ButtonSize
                                                            .buttonNormal.value
                                                            .toDouble()),
                                                    padding: context.paddingLow,
                                                    backgroundColor: ColorConstants
                                                        .registrationButtonBackgroundColor),
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(ImageConstants
                                                        .googleIcon
                                                        .imageWithPath),
                                                    Text(
                                                      StringConstants
                                                          .loginWithGoogleButtonText,
                                                      style: context
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                              color: ColorConstants
                                                                  .signUpWithGoogleButtonTextColor),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : _createAccountBottomSheet(context)
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ));
  }

  Padding _createAccountBottomSheet(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.onlyLeftPaddingLow,
              child: Text(
                "Full name",
                style: context.textTheme.titleMedium?.copyWith(
                    color: ColorConstants.registrationTextFormFieldColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) => value.isNullOrEmpty ? 'Not empty' : null,
              decoration: const InputDecoration(
                hintText: "Enter your full name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            Padding(
              padding: context.onlyLeftPaddingLow,
              child: Text(
                "Email Adress",
                style: context.textTheme.titleMedium?.copyWith(
                    color: ColorConstants.registrationTextFormFieldColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) => value.isNullOrEmpty ? 'Not empty' : null,
              decoration: const InputDecoration(
                hintText: "Enter your full name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            Padding(
              padding: context.onlyLeftPaddingLow,
              child: Text(
                "Password",
                style: context.textTheme.titleMedium?.copyWith(
                    color: ColorConstants.registrationTextFormFieldColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) => value.isNullOrEmpty ? 'Not empty' : null,
              decoration: const InputDecoration(
                hintText: "*********",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                              ButtonSize.buttonNormal.value.toDouble()),
                          padding: context.paddingLow,
                          backgroundColor:
                              ColorConstants.registrationButtonBackgroundColor),
                      onPressed: () {},
                      child: Text(
                        StringConstants.registrationButtonText,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: ColorConstants.registrationButtonTextColor),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                              ButtonSize.buttonNormal.value.toDouble()),
                          padding: context.paddingLow,
                          backgroundColor:
                              ColorConstants.registrationButtonBackgroundColor),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(ImageConstants.googleIcon.imageWithPath),
                          Text(
                            StringConstants.signUpWithGoogleButtonText,
                            style: context.textTheme.titleMedium?.copyWith(
                                color: ColorConstants
                                    .signUpWithGoogleButtonTextColor),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
