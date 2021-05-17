import 'custom_button.dart';
import 'package:flutter/widgets.dart';

class SignInButton extends CustomButton {
  SignInButton({
     String text,
     Color primary,
     VoidCallback onPressed,
  }) : super(child: Text(text), primary: primary, onPress: onPressed);
}
