import 'package:task_project/data/core/algorithm.dart';


void drawGraph({required int index}) {
  curPath = [];
  results = [];
  fields = allFields[index];
  matrix = allMatrixs[index];
  start = allStarts[index];
  end = allEnds[index];

  findPath(allStarts[index][0], allStarts[index][1]);
}
