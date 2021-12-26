import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'drawer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _splineList =
      <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
  late String _selectedSplineType;
  late SplineType _spline;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _selectedSplineType = 'natural';
    _spline = SplineType.natural;
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  final textColor = HexColor("#3D3090");

  Widget _infoCard(context, String cardTitle, cardDes) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$cardTitle",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$cardDes",
            style: TextStyle(
                color: HexColor("#E13094"),
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    _key.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.pink,
                  ))),
          title: Image(
            image: AssetImage("assets/images/androilogo.png"),
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image(image: AssetImage("assets/images/profilePic.png")))
          ],
        ),
        key: _key,
        drawer: NavDrawer(),
        backgroundColor: HexColor("#F8F8F8"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "Hello, Jonny!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: textColor),
                    )),
                Text(
                  "Look at your progress so far!",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: HexColor("#E13094")),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 30, bottom: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: textColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "01/11/2021 - 14/11/2021",
                            style: TextStyle(color: textColor, fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: _buildTypesSplineChart()),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoCard(context, "89",
                              "hours volunteered for us to date"),
                          _infoCard(context, "24",
                              "amount of current record entries"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoCard(
                              context, "65", "timesheets approved so far"),
                          _infoCard(context, "12",
                              "Amount of months volunteered at charity"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoCard(context, "03",
                              "amount of projects you have supported"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SfCartesianChart _buildTypesSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: ''),
      primaryXAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          minimum: -0.1,
          maximum: 0.2,
          interval: 0.1,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplineTypesSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<_ChartData, num>> _getSplineTypesSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2011, 0.05),
      _ChartData(2011.25, 0),
      _ChartData(2011.50, 0.03),
      _ChartData(2011.75, 0),
      _ChartData(2012, 0.04),
      _ChartData(2012.25, 0.02),
      _ChartData(2012.50, -0.01),
      _ChartData(2012.75, 0.01),
      _ChartData(2013, -0.08),
      _ChartData(2013.25, -0.02),
      _ChartData(2013.50, 0.03),
      _ChartData(2013.75, 0.05),
      _ChartData(2014, 0.04),
      _ChartData(2014.25, 0.02),
      _ChartData(2014.50, 0.04),
      _ChartData(2014.75, 0),
      _ChartData(2015, 0.02),
      _ChartData(2015.25, 0.10),
      _ChartData(2015.50, 0.09),
      _ChartData(2015.75, 0.11),
      _ChartData(2016, 0.12),
    ];
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(

          /// To set the spline type here.
          splineType: _spline,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2)
    ];
  }

  /// Method to change the spline type using dropdown menu.
  void _onPositionTypeChange(String item) {
    _selectedSplineType = item;
    if (_selectedSplineType == 'natural') {
      _spline = SplineType.natural;
    }
    if (_selectedSplineType == 'monotonic') {
      _spline = SplineType.monotonic;
    }
    if (_selectedSplineType == 'cardinal') {
      _spline = SplineType.cardinal;
    }
    if (_selectedSplineType == 'clamped') {
      _spline = SplineType.clamped;
    }
    setState(() {
      /// update the spline type changes
    });
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}
