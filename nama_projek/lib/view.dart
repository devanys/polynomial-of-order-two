import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'controller.dart'; 
import 'model.dart'; 

class CurveView extends StatefulWidget {
  @override
  _CurveViewState createState() => _CurveViewState();
}

class _CurveViewState extends State<CurveView> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  late List<charts.Series<CurveModel, double>> seriesList;

  @override
  void initState() {
    super.initState();
    seriesList = [];
  }

  void _generateCurve() {
    double a = double.tryParse(aController.text) ?? 0.0;
    double b = double.tryParse(bController.text) ?? 0.0;
    double c = double.tryParse(cController.text) ?? 0.0;

    List<CurveModel> data = CurveController.generateCurve(a, b, c);
    setState(() {
      seriesList = [
        charts.Series<CurveModel, double>(
          id: 'Curve',
          domainFn: (CurveModel curve, _) => curve.x,
          measureFn: (CurveModel curve, _) => curve.y,
          data: data,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polynomial Orde'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Color.fromARGB(255, 0, 0, 0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: aController,
              style: TextStyle(color: Colors.green), 
              decoration: InputDecoration(
                labelText: 'Value of a (-10 > 10)',
                labelStyle: TextStyle(color: Colors.green), 
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: bController,
              style: TextStyle(color: Colors.green), 
              decoration: InputDecoration(
                labelText: 'Value of b',
                labelStyle: TextStyle(color: Colors.green),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: cController,
              style: TextStyle(color: Colors.green), 
              decoration: InputDecoration(
                labelText: 'Value of c',
                labelStyle: TextStyle(color: Colors.green), 
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _generateCurve,
              child: Text('Generate Curve'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: seriesList.isEmpty
                  ? Center(
                      child: Text(
                        'No data to display',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  : charts.LineChart(
                      seriesList,
                      animate: true,
                      defaultRenderer: charts.LineRendererConfig(
                        includePoints: true,
                      ),
                      behaviors: [
                        charts.ChartTitle(
                          'X-Axis',
                          behaviorPosition: charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea,
                          titleStyleSpec: charts.TextStyleSpec(color: charts.MaterialPalette.white),                        ),
                        charts.ChartTitle(
                          'Y-Axis',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea,
                          titleStyleSpec: charts.TextStyleSpec(color: charts.MaterialPalette.white),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
