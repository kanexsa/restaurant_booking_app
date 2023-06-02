enum ImageConstants {
  onboardFirstImage('onboardfirst'),
  onboardSecondImage('onboardtwo'),
  onboardThirdImage('onboardthree'),
  welcomePageImage('welcomepage');

  final String value;

  const ImageConstants(this.value);

  String get imageWithPath => 'assets/images/$value.png';
}
