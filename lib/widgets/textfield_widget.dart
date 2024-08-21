import 'package:flutter/material.dart';
import 'package:task_management/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hinitText;
  final double borderRadius;
  final int? maxLine;

  const TextFieldWidget(
      {super.key,
      required this.textController,
      required this.hinitText,
      this.borderRadius = 30,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: textController,
      decoration: InputDecoration(
        fillColor: AppColors.textHolder,
        filled: true,
        hintText: hinitText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
