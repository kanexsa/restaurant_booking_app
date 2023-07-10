enum ImageConstants {
  onboardFirstImage('onboardfirst'),
  onboardSecondImage('onboardtwo'),
  onboardThirdImage('onboardthree'),
  welcomePageImage('welcomepage'),
  googleIcon('google');

  final String value;

  const ImageConstants(this.value);

  String get imageWithPath => 'assets/images/$value.png';
}
