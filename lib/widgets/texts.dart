import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;

  const TextWidget({
    super.key,
    required this.text1,
    required this.text2,required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:color),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
