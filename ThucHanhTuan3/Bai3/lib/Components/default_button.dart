import 'package:flutter/material.dart';
import '../constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? press; // Thay đổi kiểu của biến press
  const DefaultButton({
    required Key key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: press, // Sử dụng onPressed với kiểu VoidCallback
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}
