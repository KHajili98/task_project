import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/data/bloc/path_bloc/path_cubit.dart';
import 'package:task_project/data/core/string_constants.dart';
import 'package:task_project/data/models/request/post_path_model.dart';

import '../../../app.dart';

class CalculationProgressWidget extends StatelessWidget {
  const CalculationProgressWidget(
      {Key? key,
      required this.apiTextController,
      required this.data,
      required this.context,
      required this.snapshot})
      : super(key: key);

  final TextEditingController apiTextController;
  final List<PostPathModel> data;
  final AsyncSnapshot<Object?> snapshot;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: maxHeight * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: maxHeight * 0.03),
                child: Stack(
                  children: [
                    SizedBox(
                      height: maxHeight * 0.15,
                      width: maxHeight * 0.15,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        value: snapshot.data as double,
                      ),
                    ),
                    Container(
                      height: maxHeight * 0.15,
                      width: maxHeight * 0.15,
                      // color: Colors.red,
                      child: Center(
                        child: Text(
                          ((snapshot.data as double) * 100).toStringAsFixed(0) +
                              " %",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: maxWidth * 0.8,
                child: Center(
                  child: Text(
                    StringConstants.calculationInfo,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.center,
          child: Container(
            padding: EdgeInsets.all(10),
            height: maxHeight * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: snapshot.data as double == 1
                      ? () {
                          context.read<PathCubit>().postPaths(
                              url: apiTextController.text, body: data);
                        }
                      : null,
                  child: Text(StringConstants.sendToServerText),
                ),
                SizedBox(
                  width: maxWidth * 0.08,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => App(),
                        ),
                        (route) => false);
                  },
                  child: Text(StringConstants.goBack),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
