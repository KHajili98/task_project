import 'dart:convert';

import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/data/models/response/get_path_model.dart';
import 'package:task_project/data/models/response/post_path_res_model.dart';
import 'package:task_project/data/core/injection.dart';

class PathDataSource {
  Future<dynamic> getPathService({required String url}) async {
    final response = await dio.get(url);

    final parsedPosts = response.data;
    return GetPathModel.fromJson(parsedPosts);
  }

  Future<dynamic> postPathService(
      {required String url, required List<PostPathModel> body}) async {
    final response = await dio.post(url, data: json.encode(body));

    return PostPathResponseModel.fromJson(response.data);
  }
}
