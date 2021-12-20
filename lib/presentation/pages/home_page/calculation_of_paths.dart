import 'package:task_project/data/core/algorithm.dart';
import 'package:task_project/data/models/response/get_path_model.dart';
import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/data/models/request/post_path_model.dart'
    as stepModel;

void calculatePaths(Data element, List<PostPathModel> data) {
  List<stepModel.Step> steps = [];

  fields = element.field!;
  startFromBackend = {"x": element.start!.x, "y": element.start!.y};
  endFromBackend = {"x": element.end!.x, "y": element.end!.y};
  matrix = getFieldsPoint(fields);
  start = getPoint(startFromBackend);
  end = getPoint(endFromBackend);
  allFields.add(element.field!);
  allMatrixs.add(getFieldsPoint(fields));
  allStarts.add(getPoint(startFromBackend));
  allEnds.add(getPoint(endFromBackend));
  curPath = [];
  results = [];
  findPath(startFromBackend["x"], startFromBackend["y"]);
  getShortPath().forEach((element) {
    steps.add(stepModel.Step(x: element[0], y: element[1]));
  });
  data.add(new PostPathModel(id: element.id, result: Result(steps: steps)));
}
