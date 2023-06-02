import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_booking_app/feature/login/login_view.dart';
import 'package:restaurant_booking_app/feature/onboard/onboard_provider.dart';
import 'package:restaurant_booking_app/product/constants/color_constants.dart';
import 'package:restaurant_booking_app/product/constants/string_constants.dart';
import 'package:restaurant_booking_app/product/models/onboard_model.dart';
import 'package:restaurant_booking_app/product/widgets/image/splash_login_welcome_pages_images.dart';
import 'package:restaurant_booking_app/product/widgets/text/sub_title_text.dart';
import 'package:restaurant_booking_app/product/widgets/text/title_text.dart';

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
    super.initState();
    controller =
        TabController(length: OnBoardItems.onboardItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: _firstScreen(context),
      ),
    );
  }

  Column _firstScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _mainWidget(context),
        context.emptySizedHeightBoxNormal,
        _bottomWidget(context)
      ],
    );
  }

  Row _bottomWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_skipButtonText(context), _tabIndicator(), _nextButton()],
    );
  }

  Expanded _mainWidget(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashLoginWelcomePagesImages(
              imagePath: OnBoardItems
                  .onboardItems[
                      ref.read(_onboardProvider.notifier).currentIndex]
                  .image),
          context.emptySizedHeightBoxNormal,
          TitleText(
              text: OnBoardItems
                  .onboardItems[
                      ref.read(_onboardProvider.notifier).currentIndex]
                  .title),
          context.emptySizedHeightBoxLow,
          SubTitleText(
              text: OnBoardItems
                  .onboardItems[
                      ref.read(_onboardProvider.notifier).currentIndex]
                  .subtitle)
        ],
      ),
    );
  }

  IconButton _nextButton() {
    return IconButton(
        onPressed: () {
          if (ref
              .read(_onboardProvider.notifier)
              .isEqual(ref.read(_onboardProvider.notifier).currentIndex)) {
            _goToLoginView();
          }
          ref.read(_onboardProvider.notifier).updateIndicator();

          controller
              ?.animateTo(ref.read(_onboardProvider.notifier).currentIndex);
          ref.read(_onboardProvider.notifier).updateOnboard(OnBoardItems
              .onboardItems[ref.read(_onboardProvider.notifier).currentIndex]);

          setState(() {});
          //Todo isLast page go sign up
        },
        icon: const Icon(
          Icons.chevron_right_outlined,
          color: ColorConstants.onboardIndicatorColor,
        ));
  }

  TabPageSelector _tabIndicator() {
    return TabPageSelector(
      controller: controller,
      color: ColorConstants.onboardUnselectedIndicatorColor,
      borderStyle: BorderStyle.none,
      selectedColor: ColorConstants.onboardIndicatorColor,
    );
  }

  TextButton _skipButtonText(BuildContext context) {
    return TextButton(
      onPressed: () {
        _goToLoginView();
      },
      child: Text(StringConstants.onBoardSkipText,
          style: context.textTheme.labelLarge
              ?.copyWith(color: ColorConstants.onboardSkipTextColor)),
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
