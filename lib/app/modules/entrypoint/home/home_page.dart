import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';
import 'package:teste/common/bar_graph.dart';
import 'package:teste/common/custom_container.dart';
import '../../../core/utils/responsive.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static const String ROUTE_PAGE = '/home';

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final List<Color> gradientsColors = [
      const Color(0xFF23B6E6),
      const Color(0xFF02D39A),
    ];

    List<double> weeklySumary = [
      4.4,
      2.5,
      42.42,
      10.50,
      100.20,
      88.99,
      90.10,
    ];
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
              ),
              //
              SizedBox(height: responsive.hp(3)),
              SizedBox(
                height: responsive.hp(40),
                child: Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          childAspectRatio: 1.1,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return SizedBox(
                              height: responsive.dp(10),
                              width: responsive.dp(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    // Usar
                                    color: Theme.of(context).brightness == Brightness.light ? kOffWhite : kBackgroundLight,
                                    height: responsive.dp(10),
                                    width: responsive.dp(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/documento.png',
                                          fit: BoxFit.cover,
                                          color: kDark,
                                        ),
                                        Text(
                                          'Checklist\nFrota',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: responsive.dp(1.5),
                                            color: kDark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: responsive.hp(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Disponibilidade da Frota',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.dp(2)),
                  ),
                ],
              ),
              SizedBox(height: responsive.hp(2)),
              SizedBox(
                height: 200,
                child: BarGraph(
                  weekklySumary: weeklySumary,
                ),
              ),
              // LineChartData(

              //   minX: 0,
              //   maxX: 11,
              //   minY: 0,
              //   maxY: 6,
              //   gridData: FlGridData(
              //     show: true,
              //     getDrawingVerticalLine: (value) {
              //       return const FlLine(
              //         color: Color(0xFF37434D),
              //         strokeWidth: 5,
              //       );
              //     },
              //     drawVerticalLine: true,
              //     getDrawingHorizontalLine: (value) {
              //       return const FlLine(
              //         color: Color(0xFF37434D),
              //         strokeWidth: 1,
              //       );
              //     },
              //   ),
              //   borderData: FlBorderData(
              //     show: true,
              //     border: Border.all(color: const Color(0xFF37434D), width: 1),
              //   ),
              //   lineBarsData: [
              //     LineChartBarData(
              //       spots: [
              //         const FlSpot(0, 3),
              //         const FlSpot(2.6, 2),
              //         const FlSpot(4.9, 5),
              //         const FlSpot(6.8, 2.5),
              //         const FlSpot(8, 4),
              //         const FlSpot(9.5, 3),
              //         const FlSpot(11, 4),
              //       ],
              //       isCurved: true,
              //       color: gradientsColors,
              //       barWidth: 5,
              //       belowBarData: BarAreaData(
              //         show: true,
              //         color: Colors.red,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
