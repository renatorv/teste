// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';
import '../app/core/utils/responsive.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containerContent});

  Widget containerContent;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .75,
      width: responsive.width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(responsive.dp(5)),
          bottomRight: Radius.circular(responsive.dp(5)),
        ),
        child: Container(
          padding: EdgeInsets.only( left: responsive.hp(2.5), right: responsive.hp(2.5)),
          width: responsive.width,
          color: Theme.of(context).brightness == Brightness.light ? kBackgroundLight : kBackgroundDark,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
      ),
    );
  }
}
