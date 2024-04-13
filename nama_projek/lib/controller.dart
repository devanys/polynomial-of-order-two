import 'model.dart';

class CurveController {
  static List<CurveModel> generateCurve(double a, double b, double c) {
    List<CurveModel> curvePoints = [];

    for (double x = -10; x <= 10; x += 0.1) {
      double y = (a * x * x) + (b * x) + c; 
      curvePoints.add(CurveModel(x: x, y: y));
    }

    return curvePoints;
  }
}
