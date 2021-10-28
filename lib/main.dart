import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'fake_data.dart';


List<PieChartData> getTheData() {
  List<Map<String, dynamic>> entries = makeFake(10000000);


  Map<String, Map<dynamic, int>> frequencies = {}; // dynamic must be a hashable primitive {'userId': {'GCWPB': 1}}
  for (final key in entries[0].keys) {
    Map<dynamic, int> inner = {};
    frequencies[key] = inner;
    for (final entry in entries) {
      dynamic value = entry[key];
      inner[value] = (inner[value] ?? 0) + 1;
    }
  }

  List<PieChartData> charts = [];
  for (final key in entries[0].keys) {
    var keyFrequencies = frequencies[key]!;
    final keyTotal = keyFrequencies.values.reduce((a, b) => a + b);

    PieChartData chart = PieChartData(sections: [], centerSpaceRadius: 18, sectionsSpace: 4);
    for (final keyFrequencyPair in keyFrequencies.entries) {
      final keyValueRate =  keyFrequencyPair.value / keyTotal;
      chart.sections.add(PieChartSectionData(title: keyFrequencyPair.key.toString(), value: keyValueRate, radius: 60));
    }
    charts.add(chart);
  }

  return charts;
}

class _MyHomePageState extends State<MyHomePage> {
  List<PieChartData> _charts = getTheData();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    PieChartData data = PieChartData(sections: [
      PieChartSectionData(value: 0.5, title: "Hello", ),
      PieChartSectionData(value: 1, title: "Hello2"),
    ], pieTouchData: PieTouchData(enabled: true, touchCallback: (event, touchResponse) {
      if (event is FlTapDownEvent) {
        
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            SizedBox(width: 200, height: 200, child: PieChart(_charts[0])),
            SizedBox(width: 200, height: 200, child: PieChart(_charts[1])),
            SizedBox(width: 200, height: 200, child: PieChart(_charts[2])),
            SizedBox(width: 200, height: 200, child: PieChart(_charts[3])),
            SizedBox(width: 200, height: 200, child: PieChart(_charts[4])),
            SizedBox(width: 200, height: 200, child: PieChart(_charts[5])),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void main() {
  runApp(const MyApp());
}