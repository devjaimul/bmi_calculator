
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class Chart extends StatefulWidget {
double? answer;
   Chart({super.key,  this.answer,   });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
            child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(minimum: 16, maximum: 40,
                      ranges: <GaugeRange>[
                        GaugeRange(startValue: 16, endValue: 20, color:Colors.green),
                        GaugeRange(startValue: 20,endValue: 25,color: Colors.orange),
                        GaugeRange(startValue: 25,endValue: 40,color: Colors.red)],
                      pointers:  <GaugePointer>[

                        NeedlePointer(value: widget.answer?.toDouble()??0)],
                      annotations:  <GaugeAnnotation>[
                        GaugeAnnotation(widget: Text((widget.answer?.toStringAsFixed(2)).toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                            angle: 90, positionFactor: 0.5
                        )]
                  )])));
  }
}
