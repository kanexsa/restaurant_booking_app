import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_booking_app/product/models/onboard_model.dart';

class OnboardProvider extends StateNotifier<OnboardState> {
  OnboardProvider() : super(const OnboardState());

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndicator() {
    _currentIndex++;
  }

  void updateOnboard(OnboardModel? onboardModel) {
    if (onboardModel == null) return;
    state = state.copyWith(onboardItems: onboardModel);
  }

  bool isEqual(int index) {
    if (OnBoardItems.onboardItems.length - 1 == index) return true;
    return false;
  }
}

class OnboardState extends Equatable {
  final OnboardModel? onboardItems;

  const OnboardState({this.onboardItems});
  @override
  List<Object?> get props => [onboardItems];

  OnboardState copyWith({OnboardModel? onboardItems}) {
    return OnboardState(onboardItems: onboardItems ?? this.onboardItems);
  }
}
