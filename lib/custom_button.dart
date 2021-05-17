import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color primary;
  final VoidCallback onPress;

  const CustomButton(
      {Key key,
      this.primary,
      this.onPress,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(primary: primary),
      onPressed: onPress,
    );
  }
}
