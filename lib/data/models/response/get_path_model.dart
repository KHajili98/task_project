import 'dart:convert';

GetPathModel getPathModelFromJson(String str) =>
    GetPathModel.fromJson(json.decode(str));

String getPathModelToJson(GetPathModel data) => json.encode(data.toJson());

class GetPathModel {
  GetPathModel({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<Data>? data;

  factory GetPathModel.fromJson(Map<String, dynamic> json) => GetPathModel(
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
    this.field,
    this.start,
    this.end,
  });

  String? id;
  List<String>? field;
  End? start;
  End? end;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        field: List<String>.from(json["field"].map((x) => x)),
        start: End.fromJson(json["start"]),
        end: End.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field": List<dynamic>.from(field!.map((x) => x)),
        "start": start!.toJson(),
        "end": end!.toJson(),
      };
}

class End {
  End({
    this.x,
    this.y,
  });

  int? x;
  int? y;

  factory End.fromJson(Map<String, dynamic> json) => End(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
