import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_booking_app/feature/login/login_view.dart';
import 'package:restaurant_booking_app/feature/onboard/onboard_provider.dart';
import 'package:restaurant_booking_app/product/constants/color_constants.dart';
import 'package:restaurant_booking_app/product/constants/string_constants.dart';
import 'package:restaurant_booking_app/product/models/onboard_model.dart';

final _onboardProvider =
    StateNotifierProvider<OnboardProvider, OnboardState>((ref) {
  return OnboardProvider();
});

class OnBoardView extends ConsumerStatefulWidget {
  const OnBoardView({super.key});

  @override
  ConsumerState<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends ConsumerState<OnBoardView>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: OnBoardItems.onboardItems.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(OnBoardItems
                    .onboardItems[
                        ref.read(_onboardProvider.notifier).currentIndex]
                    .imageWithPath),
                context.emptySizedHeightBoxNormal,
                Text(
                  OnBoardItems
                      .onboardItems[
                          ref.read(_onboardProvider.notifier).currentIndex]
                      .title,
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: ColorConstants.onboardTitleTextColor),
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.horizontalPaddingMedium,
                  child: Text(
                    OnBoardItems
                        .onboardItems[
                            ref.read(_onboardProvider.notifier).currentIndex]
                        .subtitle,
                    style: context.textTheme.labelSmall?.copyWith(
                        color: ColorConstants.onboardSubtitleTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          context.emptySizedHeightBoxNormal,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  _goToLoginView();
                },
                child: Text(StringConstants.onBoardSkipText,
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: ColorConstants.onboardSkipTextColor)),
              ),
              TabPageSelector(
                controller: controller,
                color: ColorConstants.onboardUnselectedIndicatorColor,
                borderStyle: BorderStyle.none,
                selectedColor: ColorConstants.onboardIndicatorColor,
              ),
              IconButton(
                  onPressed: () {
                    if (ref.read(_onboardProvider.notifier).isEqual(
                        ref.read(_onboardProvider.notifier).currentIndex)) {
                      _goToLoginView();
                    }
                    ref.read(_onboardProvider.notifier).updateIndicator();

                    controller?.animateTo(
                        ref.read(_onboardProvider.notifier).currentIndex);
                    ref.read(_onboardProvider.notifier).updateOnboard(
                        OnBoardItems.onboardItems[
                            ref.read(_onboardProvider.notifier).currentIndex]);

                    setState(() {});
                    //Todo isLast page go sign up
                  },
                  icon: const Icon(
                    Icons.chevron_right_outlined,
                    color: ColorConstants.onboardIndicatorColor,
                  ))
            ],
          )
        ],
      ),
    );
  }

  void _goToLoginView() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (Route<dynamic> route) => false);
  }
}
