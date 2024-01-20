import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';
import 'package:teste/common/constants/constants.dart';
import 'package:teste/common/custom_container.dart';
import '../../../core/utils/responsive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String ROUTE_PAGE = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GDPData> _chartData;
  late List<DisponibilidadeDados> _disponibilidadeDados;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _disponibilidadeDados = getDisponibilidadeDados();
    _tooltipBehavior = TooltipBehavior(enable: true, format: 'point.x: point.y%');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: responsive.hp(.4), left: responsive.hp(2.5), right: responsive.hp(2.5)),
              color: Theme.of(context).brightness == Brightness.light ? kBackgroundLight : kBackgroundDark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Olá, ',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ? kOffBlack : kOffWhite,
                        fontSize: responsive.dp(2.6),
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
                      ? Image.asset('assets/images/logo_preta.png',scale: 1.5)
                      : Image.asset('assets/images/logo_branca.png',scale:1.5)
                ],
              ),
            ),
            CustomContainer(
              containerContent: Column(
                children: [
                  SizedBox(height: responsive.hp(2)),
                  SizedBox(
                    height: responsive.hp(38),
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
                  SizedBox(height: responsive.hp(1)),
                  SizedBox(
                    height: responsive.dp(30),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(responsive.wp(12)),
                            color: Theme.of(context).brightness == Brightness.light ? kWhite : kOffBlack,
                          ),
                          width: responsive.wp(85),
                          child: SfCircularChart(
                            title: const ChartTitle(text: 'Disponibilidade no mês'),
                            palette: const <Color>[
                              Color(0xFF009340),
                              Color(0xFFFF8628),
                              Color(0xFFe8f1f2),
                            ],
                            legend: Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              textStyle: TextStyle(
                                fontSize: responsive.wp(2),
                              ),
                            ),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              PieSeries<DisponibilidadeDados, String>(
                                dataSource: _disponibilidadeDados,
                                xValueMapper: (DisponibilidadeDados data, _) => data.desc,
                                yValueMapper: (DisponibilidadeDados data, _) => data.valor,
                                dataLabelMapper: (DisponibilidadeDados data,_) => '${data.valor}%',
                                dataLabelSettings: const DataLabelSettings(isVisible: true),
                                enableTooltip: true,

                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: responsive.wp(1)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(responsive.wp(12)),
                            color: Theme.of(context).brightness == Brightness.light ? kWhite : kOffBlack,
                          ),
                          width: responsive.wp(85),
                          child: SfCircularChart(
                            title: const ChartTitle(text: 'Disponibilidade da Frota'),
                            legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                textStyle: TextStyle(fontSize: responsive.wp(2))),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              PieSeries<GDPData, String>(
                                dataSource: _chartData,
                                xValueMapper: (GDPData data, _) => data.continent,
                                yValueMapper: (GDPData data, _) => data.gdp,
                                dataLabelSettings: const DataLabelSettings(isVisible: true),
                                enableTooltip: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsive.hp(1))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(continent: 'Oceania', gdp: 1600),
      GDPData(continent: 'Africa', gdp: 2490),
      GDPData(continent: 'S America', gdp: 2900),
      GDPData(continent: 'Europa', gdp: 23050),
      GDPData(continent: 'N America', gdp: 24880),
      GDPData(continent: 'Asia', gdp: 34390),
    ];
    return chartData;
  }

  List<DisponibilidadeDados> getDisponibilidadeDados() {
    final List<DisponibilidadeDados> disponibilidadeDados = [
      DisponibilidadeDados(desc: 'até dia 10', valor: 80),
      DisponibilidadeDados(desc: 'dia 11 a 20', valor: 60),
      DisponibilidadeDados(desc: 'dia 21 a 30', valor: 100),
    ];

    return disponibilidadeDados;
  }
}

class DisponibilidadeDados {
  final String desc;
  final int valor;

  DisponibilidadeDados({required this.desc, required this.valor});
}

class GDPData {
  final String continent;
  final int gdp;

  GDPData({required this.continent, required this.gdp});
}
