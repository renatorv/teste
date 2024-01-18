import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';

import '../../utils/responsive.dart';

class TbcButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  final Color? color;
  final Color? colorBtnVoltar;
  final bool? borderSide;
  final double size;

  const TbcButton({
    super.key,
    required this.label,
    required this.onPress,
    this.color,
    this.colorBtnVoltar,
    this.borderSide = false,
    this.size = 14
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimary,
        padding: EdgeInsets.symmetric(
          vertical: responsive.dp(1.4),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: onPress,
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: color,
          fontSize: size,
        ),
      ),
    );
  }
}
