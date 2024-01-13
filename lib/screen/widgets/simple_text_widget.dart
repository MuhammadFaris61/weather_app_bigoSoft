
import 'package:flutter/material.dart';
class SimpleTextWidget extends StatelessWidget {
  const SimpleTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15,),textAlign: TextAlign.center,);
  }
}