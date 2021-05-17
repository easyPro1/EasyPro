import 'custom_button.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends CustomButton {
  MenuButton({
     String text,
     Color primary,
     VoidCallback onPressed,
  }) : super(child: Text(text), primary: primary, onPress: onPressed);
}
