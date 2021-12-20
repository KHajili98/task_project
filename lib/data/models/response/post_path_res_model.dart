// To parse this JSON data, do
//
//     final postPathResponseModel = postPathResponseModelFromJson(jsonString);

import 'dart:convert';

PostPathResponseModel postPathResponseModelFromJson(String str) =>
    PostPathResponseModel.fromJson(json.decode(str));

String postPathResponseModelToJson(PostPathResponseModel data) =>
    json.encode(data.toJson());

class PostPathResponseModel {
  PostPathResponseModel({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<Data>? data;

  factory PostPathResponseModel.fromJson(Map<String, dynamic> json) =>
      PostPathResponseModel(
        error: json["error"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.correct,
  });

  String? id;
  bool? correct;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        correct: json["correct"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "correct": correct,
      };
}
