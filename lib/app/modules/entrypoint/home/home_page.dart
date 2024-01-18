import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';
import 'package:teste/common/custom_container.dart';
import '../../../core/utils/responsive.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static const String ROUTE_PAGE = '/home';

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Olá, ',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ? kOffBlack : kOffWhite,
                        fontSize: responsive.dp(3.6),
                      ),
                      children: const [
                        TextSpan(
                          text: 'Mauro',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme.of(context).brightness == Brightness.light
                      ? Image.asset('assets/images/logo_preta.png')
                      : Image.asset('assets/images/logo_branca.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
