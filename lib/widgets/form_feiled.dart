import 'package:flutter/material.dart';

class FormFiled extends StatelessWidget {
  const FormFiled({
    super.key,
     this.long, required this.text, this.controller,
  });

  final double? long;
  final String text;
  final  controller ;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width:long ?? size.width * .20 ,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
