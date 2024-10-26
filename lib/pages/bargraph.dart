import 'package:flutter/material.dart';
//import 'package:classico/pages/homepage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:intl/intl.dart';
import 'package:classico/pages/homepage.dart';

class Bargraph extends StatefulWidget {
  const Bargraph({super.key});

  @override
  State<Bargraph> createState() => _BargraphState();
}

class _BargraphState extends State<Bargraph> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),

      //Graph in Container
      body: Center(
        child: Column(
          children: [
            Text("DAILY USAGE OF POWER",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink)),

            Container(
              width: 390,
              height: 550,
              child: SfCartesianChart(
                series: <ChartSeries>[
                  BarSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData gdp, _) => gdp.continent,
                    yValueMapper: (GDPData gdp, _) => gdp.gdp,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),

                    // Width of the bars
                    width: 0.5,
                    // Spacing between the bars
                    spacing: 0.1,
                    color: Colors.deepPurple,
                  )
                ],

                //X - Axis

                primaryXAxis: CategoryAxis(
                  //Customize the axis line.
                  axisLine: AxisLine(color: Colors.black, width: 2),

                  //Grid line customization.
                  majorGridLines: MajorGridLines(color: Colors.black, width: 1),

                  //Minor grid line customization.
                  minorGridLines: MinorGridLines(color: Colors.grey, width: 1),

                  //Major tick line customization.
                  majorTickLines: MajorTickLines(color: Colors.black, size: 10),

                  //Minor tick line customization.
                  minorTickLines:
                      MinorTickLines(color: Colors.black12, size: 7),

                  //labelIntersectAction: AxisLabelIntersectAction.rotate90,

                  //Axis title customization.
                  title: AxisTitle(
                    text: 'Days of the Week[X]',
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),

                  //Label Style.
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Y - Axis
                primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,

                  //Customize the axis line.
                  axisLine: AxisLine(color: Colors.black, width: 2.5),

                  //Grid line customization.
                  majorGridLines: MajorGridLines(color: Colors.black, width: 1),

                  //Minor grid line customization.
                  minorGridLines: MinorGridLines(color: Colors.grey, width: 1),

                  //Major tick line customization.
                  majorTickLines: MajorTickLines(color: Colors.black, size: 10),

                  //Minor tick line customization.
                  minorTickLines:
                      MinorTickLines(color: Colors.black12, size: 7),

                  //Label Style
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),

                  //
                  title: AxisTitle(
                      text: "Power(W-Watt)[Y]",
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
            ),

            //
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                "  Back To Home  ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Monday', 16),
      GDPData('Tuesday', 24),
      GDPData('Wednesday', 29),
      GDPData('Thursday', 13),
      GDPData('Friday', 20),
      //GDPData('Saturday', 1600),
      //GDPData('Sunday', 2490),
    ];

    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp); // constructor for receiving the parmeters
  final String continent;
  final double gdp;
}
