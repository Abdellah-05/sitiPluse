import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
import 'package:siti/mqtt_client/mqtt_client.dart';
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MqttClient client;
  var topic = "F01/R01/M06/flow";

  @override
  Widget build(BuildContext context) {

    connect().then((value) => client = value);

    return Scaffold(
      appBar: AppBar(title: const Text('SitiPlus Dashboard')),
      body: Container(
        child: ResponsiveGridRow(
            children: [

              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 40,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: Text("Machine 01",style: TextStyle(fontSize: 25.0) ),
                ),
              ),

              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,

                  child: Text("Arrets \r\n \t 00", style: TextStyle(fontSize: 23.0)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    //color: Colors.blue,
                    child: RaisedButton(onPressed: (){
                      print("-------------------------------------------- ok");

                      //connect().then((value) => client = value);
                      var K = client?.subscribe(topic, MqttQos.atLeastOnce);
                      print('****************>> $K');

                      },
                        color: Colors.green,
                        child: Text("Click here ",style: TextStyle(fontSize: 23.0))
                        )
                ),
              ),
              ResponsiveGridCol(
                lg: 12,   
                child: Container(
                  height: 180,
                  alignment: Alignment(0, 0),
                  //color: Colors.purple,
                  child: SfRadialGauge(
                    /* title: GaugeTitle(
                      text: 'Machine 01',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),*/

                    axes: <RadialAxis>[RadialAxis( startAngle: 180, endAngle: 0,
                        interval: 10,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(thickness: 30), showTicks: false,
                        pointers: <GaugePointer>[

                          NeedlePointer(value: 90,
                              enableAnimation: true,
                              needleStartWidth: 0,
                              needleEndWidth: 6,
                              needleColor: Color(0xFFDADADA),
                              knobStyle: KnobStyle(
                                  color: Colors.white, borderColor: Color(0xFFDADADA),
                                  knobRadius: 0.06,
                                  borderWidth: 0.04),
                              tailStyle: TailStyle(color: Color(0xFFDADADA), width: 5,
                                  length: 0.15)
                          ),
                          RangePointer(value: 90,
                              width: 30,
                              enableAnimation: true,
                              color: Colors.deepOrange)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(axisValue: 50,angle: 90, positionFactor: 0.3,
                              widget: Text("90", style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))]
                    )
                    ],
                  ) ,

                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 230,
                  alignment: Alignment(0, 0),
                  //color: Colors.orange,
                  child:SfCartesianChart() ,
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 50,
                  alignment: Alignment(0, 0),
                  //color: Colors.green,
                  child: RaisedButton(onPressed: (){},color: Colors.green,
                      child: Text("Reset",style: TextStyle(fontSize: 25.0))),
                ),
              ),

            ]),



      ),
    );
  }
 Future<String> getP() async {
   return client?.subscribe(topic, MqttQos.atLeastOnce).toString();
 }
}