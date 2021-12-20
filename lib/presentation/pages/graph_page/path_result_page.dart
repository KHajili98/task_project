import 'package:flutter/material.dart';
import 'package:task_project/data/core/algorithm.dart';

import 'calculation_of_graph.dart';
import 'widgets/create_table.dart';

class GraphPage extends StatefulWidget {
  GraphPage({Key? key, this.title, this.path, this.indexFromData})
      : super(key: key);

  final String? title;
  final String? path;
  final int? indexFromData;

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  void initState() {
    super.initState();
    drawGraph(index: widget.indexFromData!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: createTable(matrix: matrix),
              ),
              Text(widget.path!)
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
