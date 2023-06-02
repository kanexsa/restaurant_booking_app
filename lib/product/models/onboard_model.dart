import 'package:restaurant_booking_app/product/enums/image_constants.dart';
import 'package:restaurant_booking_app/product/constants/string_constants.dart';

class OnboardModel {
  final String title;
  final String subtitle;
  final String image;

  OnboardModel(this.title, this.subtitle, this.image);
}

class OnBoardItems {
  static final List<OnboardModel> onboardItems = [
    OnboardModel(
        StringConstants.onboardTitleTextFirst,
        StringConstants.onboardSubtitleTextFirst,
        ImageConstants.onboardFirstImage.imageWithPath),
    OnboardModel(
        StringConstants.onboardTitleTextSecond,
        StringConstants.onboardSubtitleTextSecond,
        ImageConstants.onboardSecondImage.imageWithPath),
    OnboardModel(
        StringConstants.onboardTitleTextThird,
        StringConstants.onboardSubtitleTextThird,
        ImageConstants.onboardThirdImage.imageWithPath),
  ];
}
