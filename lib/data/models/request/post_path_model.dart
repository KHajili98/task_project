// To parse this JSON data, do
//
//     final postPathModel = postPathModelFromJson(jsonString);

import 'dart:convert';

List<PostPathModel> postPathModelFromJson(String str) =>
    List<PostPathModel>.from(
        json.decode(str).map((x) => PostPathModel.fromJson(x)));

String postPathModelToJson(List<PostPathModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostPathModel {
  PostPathModel({
    this.id,
    this.result,
  });

  String? id;
  Result? result;

  factory PostPathModel.fromJson(Map<String, dynamic> json) => PostPathModel(
        id: json["id"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.steps,
    this.path = "string",
  });

  List<Step>? steps;
  String? path;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps!.map((x) => x.toJson())),
        "path": path,
      };
}

class Step {
  Step({
    this.x,
    this.y,
  });

  int? x;
  int? y;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
