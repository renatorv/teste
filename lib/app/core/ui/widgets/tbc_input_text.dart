import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/app/core/ui/temas.dart';

import '../../utils/responsive.dart';

class TbcInputText extends StatelessWidget {
  final String label;
  final TextInputType? keyBoardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? mask;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Color? colorInput;

  const TbcInputText({
    super.key,
    required this.label,
    this.keyBoardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.mask,
    this.controller,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.maxLength,
    this.colorInput = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return TextFormField(
      maxLength: maxLength,
      textInputAction: textInputAction,
      focusNode: focusNode,
      inputFormatters: mask,
      controller: controller,
      keyboardType: keyBoardType,
      validator: validator,
      obscureText: obscureText!,
      style: TextStyle(
        color: colorInput,
      ),
      cursorColor: kSecondary,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimary,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimary,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: responsive.dp(2.3),
          color: kPrimary,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: kPrimary,
      ),
    );
  }
}
