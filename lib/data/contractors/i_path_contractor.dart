import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/data/models/response/get_path_model.dart';
import 'package:task_project/data/models/response/post_path_res_model.dart';

abstract class IPathRepository {
  Future<GetPathModel> getPaths({required String url});
  Future<PostPathResponseModel> postPath(
      {required String url, required List<PostPathModel> paths});
}
